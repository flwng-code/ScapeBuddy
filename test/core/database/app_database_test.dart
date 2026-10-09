import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scapebuddy/core/database/app_database.dart';

void main() {
  late Directory temporaryDirectory;
  late String databasePath;
  late AppDatabase database;

  setUp(() async {
    temporaryDirectory = await Directory.systemTemp.createTemp('scapebuddy-');
    databasePath =
        '${temporaryDirectory.path}${Platform.pathSeparator}scapebuddy.sqlite';
    database = AppDatabase(NativeDatabase(File(databasePath)));
  });

  tearDown(() async {
    await database.close();
    await temporaryDirectory.delete(recursive: true);
  });

  test('notes and a complete loadout persist after reopening SQLite', () async {
    await database.addNote('Finished the first boss guide.');
    final buildId = await database.saveBuild(
      name: 'Starter setup',
      items: const [
        BuildItemDraft(
          slot: 'helm',
          itemName: 'Helm 1',
          assetPath: 'assets/images/builds/helm_1.png',
        ),
        BuildItemDraft(
          slot: 'body',
          itemName: 'Body 2',
          assetPath: 'assets/images/builds/body_2.png',
        ),
        BuildItemDraft(
          slot: 'legs',
          itemName: 'Legs 3',
          assetPath: 'assets/images/builds/legs_3.png',
        ),
        BuildItemDraft(
          slot: 'weapon',
          itemName: 'Weapon 1',
          assetPath: 'assets/images/builds/weapon_1.png',
        ),
      ],
    );

    await database.close();
    database = AppDatabase(NativeDatabase(File(databasePath)));

    final notes = await database.getNotes();
    final builds = await database.getBuilds();
    final items = await database.itemsForBuild(buildId);

    expect(notes, hasLength(1));
    expect(notes.single.content, 'Finished the first boss guide.');
    expect(builds, hasLength(1));
    expect(builds.single.name, 'Starter setup');
    expect(items.map((item) => item.slot).toSet(), {
      'helm',
      'body',
      'legs',
      'weapon',
    });
    expect(items.every((item) => File(item.assetPath).existsSync()), isTrue);
  });

  test('rejects an incomplete loadout before writing it', () async {
    expect(
      () => database.saveBuild(
        name: 'Incomplete setup',
        items: const [
          BuildItemDraft(
            slot: 'helm',
            itemName: 'Helm 1',
            assetPath: 'assets/images/builds/helm_1.png',
          ),
        ],
      ),
      throwsArgumentError,
    );

    expect(await database.getBuilds(), isEmpty);
  });

  test('rejects blank notes', () {
    expect(() => database.addNote('   '), throwsArgumentError);
  });

  test('every gear choice points to an image in the assets folder', () {
    for (final slot in ['helm', 'body', 'legs', 'weapon']) {
      for (var choice = 1; choice <= 3; choice++) {
        final image = File('assets/images/builds/${slot}_$choice.png');
        expect(image.existsSync(), isTrue, reason: image.path);
      }
    }
  });
}
