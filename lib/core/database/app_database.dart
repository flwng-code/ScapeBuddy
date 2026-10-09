import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// A saved note returned from the local database.
class NoteRecord {
  const NoteRecord({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  final int id;
  final String content;
  final DateTime createdAt;
}

/// The name and date for one saved gear loadout.
class SavedBuildRecord {
  const SavedBuildRecord({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  final int id;
  final String name;
  final DateTime createdAt;
}

/// One selected gear item belonging to a saved loadout.
class SavedBuildItemRecord {
  const SavedBuildItemRecord({
    required this.slot,
    required this.itemName,
    required this.assetPath,
  });

  final String slot;
  final String itemName;
  final String assetPath;
}

/// The small amount of gear data needed to save one slot.
class BuildItemDraft {
  const BuildItemDraft({
    required this.slot,
    required this.itemName,
    required this.assetPath,
  });

  final String slot;
  final String itemName;
  final String assetPath;
}

/// One SQLite database shared by Milestone Notes and Build Maker.
///
/// Drift opens a local SQLite file on native platforms and SQLite-backed
/// browser storage on web. The SQL values entered by a user are always bound
/// as parameters instead of being inserted into SQL text.
class AppDatabase extends GeneratedDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(
        executor ??
            driftDatabase(
              name: 'scapebuddy',
              web: DriftWebOptions(
                sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                driftWorker: Uri.parse('drift_worker.dart.js'),
              ),
            ),
      );

  /// Keep a single open connection for both screens.
  static final AppDatabase instance = AppDatabase();

  @override
  int get schemaVersion => 1;

  // These tables are created in the migration below using explicit SQL.
  @override
  Iterable<TableInfo> get allTables => const [];

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await customStatement('''
            CREATE TABLE milestone_notes (
              id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
              content TEXT NOT NULL,
              created_at TEXT NOT NULL DEFAULT (
                strftime('%Y-%m-%dT%H:%M:%fZ', 'now')
              )
            )
          ''');
      await customStatement('''
            CREATE TABLE saved_builds (
              id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              created_at TEXT NOT NULL DEFAULT (
                strftime('%Y-%m-%dT%H:%M:%fZ', 'now')
              )
            )
          ''');
      await customStatement('''
            CREATE TABLE saved_build_items (
              build_id INTEGER NOT NULL,
              slot TEXT NOT NULL CHECK (
                slot IN ('helm', 'body', 'legs', 'weapon')
              ),
              item_name TEXT NOT NULL,
              asset_path TEXT NOT NULL,
              PRIMARY KEY (build_id, slot),
              FOREIGN KEY (build_id) REFERENCES saved_builds(id)
                ON DELETE CASCADE
            )
          ''');
    },
    beforeOpen: (details) async {
      // SQLite disables foreign-key checks by default on some platforms.
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// Reads notes newest-first. The page reloads this list after each save.
  Future<List<NoteRecord>> getNotes() async {
    final rows = await customSelect('''
      SELECT id, content, created_at
      FROM milestone_notes
      ORDER BY created_at DESC, id DESC
    ''').get();

    return [
      for (final row in rows)
        NoteRecord(
          id: row.read<int>('id'),
          content: row.read<String>('content'),
          createdAt: DateTime.parse(row.read<String>('created_at')),
        ),
    ];
  }

  Future<int> addNote(String content) {
    final cleanedContent = content.trim();
    if (cleanedContent.isEmpty) {
      throw ArgumentError.value(content, 'content', 'A note cannot be empty.');
    }

    return customInsert(
      'INSERT INTO milestone_notes (content) VALUES (?)',
      variables: [Variable.withString(cleanedContent)],
    );
  }

  /// Reads loadouts newest-first for the saved builds list.
  Future<List<SavedBuildRecord>> getBuilds() async {
    final rows = await customSelect('''
      SELECT id, name, created_at
      FROM saved_builds
      ORDER BY created_at DESC, id DESC
    ''').get();

    return [
      for (final row in rows)
        SavedBuildRecord(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          createdAt: DateTime.parse(row.read<String>('created_at')),
        ),
    ];
  }

  Future<List<SavedBuildItemRecord>> itemsForBuild(int buildId) async {
    final rows = await customSelect(
      '''
        SELECT slot, item_name, asset_path
        FROM saved_build_items
        WHERE build_id = ?
      ''',
      variables: [Variable.withInt(buildId)],
    ).get();

    return [
      for (final row in rows)
        SavedBuildItemRecord(
          slot: row.read<String>('slot'),
          itemName: row.read<String>('item_name'),
          assetPath: row.read<String>('asset_path'),
        ),
    ];
  }

  /// Saves the loadout and all its selected items as one SQLite transaction.
  Future<int> saveBuild({
    required String name,
    required List<BuildItemDraft> items,
  }) {
    const requiredSlots = {'helm', 'body', 'legs', 'weapon'};
    final selectedSlots = items.map((item) => item.slot).toSet();
    if (name.trim().isEmpty) {
      throw ArgumentError.value(name, 'name', 'A loadout needs a name.');
    }
    if (items.length != requiredSlots.length ||
        !selectedSlots.containsAll(requiredSlots) ||
        items.any(
          (item) =>
              item.itemName.trim().isEmpty || item.assetPath.trim().isEmpty,
        )) {
      throw ArgumentError(
        'A loadout must include one named item in every slot.',
      );
    }

    return transaction(() async {
      final buildId = await customInsert(
        'INSERT INTO saved_builds (name) VALUES (?)',
        variables: [Variable.withString(name.trim())],
      );

      for (final item in items) {
        await customInsert(
          '''
            INSERT INTO saved_build_items
              (build_id, slot, item_name, asset_path)
            VALUES (?, ?, ?, ?)
          ''',
          variables: [
            Variable.withInt(buildId),
            Variable.withString(item.slot),
            Variable.withString(item.itemName),
            Variable.withString(item.assetPath),
          ],
        );
      }

      return buildId;
    });
  }
}
