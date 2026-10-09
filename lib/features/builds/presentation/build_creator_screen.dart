import 'package:flutter/material.dart';

import '../../../core/database/app_database.dart';

/// Builds a simple four-piece loadout and saves it locally with SQLite.
class BuildCreatorScreen extends StatefulWidget {
  const BuildCreatorScreen({super.key});

  @override
  State<BuildCreatorScreen> createState() => _BuildCreatorScreenState();
}

class _BuildCreatorScreenState extends State<BuildCreatorScreen> {
  final AppDatabase _database = AppDatabase.instance;
  final TextEditingController _nameController = TextEditingController();
  final Map<_GearSlot, _GearOption> _selectedGear = {};
  late Future<List<SavedBuildRecord>> _savedBuilds;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _savedBuilds = _database.getBuilds();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _canSave =>
      _nameController.text.trim().isNotEmpty &&
      _GearSlot.values.every(_selectedGear.containsKey);

  List<_GearOption> _optionsFor(_GearSlot slot) {
    return List.generate(
      3,
      (index) => _GearOption(
        name: '${slot.label} ${index + 1}',
        assetPath: 'assets/images/builds/${slot.assetPrefix}_${index + 1}.png',
      ),
    );
  }

  Future<void> _chooseGear(_GearSlot slot) async {
    final choice = await showModalBottomSheet<_GearOption>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        final options = _optionsFor(slot);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose ${slot.label}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                for (final option in options)
                  ListTile(
                    leading: Image.asset(
                      option.assetPath,
                      width: 56,
                      height: 56,
                      fit: BoxFit.contain,
                    ),
                    title: Text(option.name),
                    trailing: const Icon(Icons.add_circle_outline),
                    onTap: () => Navigator.of(context).pop(option),
                  ),
              ],
            ),
          ),
        );
      },
    );

    if (choice != null && mounted) {
      setState(() => _selectedGear[slot] = choice);
    }
  }

  Future<void> _saveBuild() async {
    if (!_canSave || _isSaving) return;

    // Build the database rows in a predictable order to match the four slots.
    final items = [
      for (final slot in _GearSlot.values)
        BuildItemDraft(
          slot: slot.name,
          itemName: _selectedGear[slot]!.name,
          assetPath: _selectedGear[slot]!.assetPath,
        ),
    ];

    setState(() => _isSaving = true);
    try {
      await _database.saveBuild(name: _nameController.text, items: items);
      if (!mounted) return;
      setState(() {
        _nameController.clear();
        _selectedGear.clear();
        _savedBuilds = _database.getBuilds();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loadout saved on this device.')),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save this loadout: $error')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selectedGear.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Build Maker')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(labelText: 'Build name'),
          ),
          const SizedBox(height: 24),
          Text(
            'GEAR SLOTS  $selectedCount/4',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _GearSlot.values.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              final slot = _GearSlot.values[index];
              return _GearSlotCard(
                slot: slot,
                choice: _selectedGear[slot],
                onTap: () => _chooseGear(slot),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'SELECTED GEAR',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                for (var index = 0; index < _GearSlot.values.length; index++)
                  _SelectedGearRow(
                    slot: _GearSlot.values[index],
                    choice: _selectedGear[_GearSlot.values[index]],
                    showDivider: index < _GearSlot.values.length - 1,
                    onTap: () => _chooseGear(_GearSlot.values[index]),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _canSave && !_isSaving ? _saveBuild : null,
              icon: const Icon(Icons.save_outlined),
              label: Text(_isSaving ? 'Saving...' : 'Save loadout'),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'SAVED LOADOUTS',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder<List<SavedBuildRecord>>(
            future: _savedBuilds,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return _BuildMessage(
                  message: 'Loadouts could not be loaded: ${snapshot.error}',
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final builds = snapshot.data!;
              if (builds.isEmpty) {
                return const _BuildMessage(
                  message: 'Your saved loadouts will appear here.',
                );
              }

              return Column(
                children: [
                  for (final build in builds)
                    _SavedBuildTile(build: build, database: _database),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

enum _GearSlot {
  helm('Helm', 'helm', Icons.shield_outlined),
  body('Body', 'body', Icons.checkroom_outlined),
  legs('Legs', 'legs', Icons.accessibility_new),
  weapon('Weapon', 'weapon', Icons.gavel_outlined);

  const _GearSlot(this.label, this.assetPrefix, this.icon);

  final String label;
  final String assetPrefix;
  final IconData icon;
}

class _GearOption {
  const _GearOption({required this.name, required this.assetPath});

  final String name;
  final String assetPath;
}

class _GearSlotCard extends StatelessWidget {
  const _GearSlotCard({
    required this.slot,
    required this.choice,
    required this.onTap,
  });

  final _GearSlot slot;
  final _GearOption? choice;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: choice == null
                    ? Icon(slot.icon, size: 56, color: Colors.black54)
                    : Image.asset(
                        choice!.assetPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(slot.icon, size: 56),
                      ),
              ),
              const SizedBox(height: 4),
              Text(
                slot.label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                choice?.name ?? 'Tap to choose',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectedGearRow extends StatelessWidget {
  const _SelectedGearRow({
    required this.slot,
    required this.choice,
    required this.showDivider,
    required this.onTap,
  });

  final _GearSlot slot;
  final _GearOption? choice;
  final bool showDivider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(slot.icon),
          title: Text(slot.label),
          subtitle: Text(choice?.name ?? 'No item selected'),
          trailing: const Icon(Icons.edit_outlined, size: 18),
        ),
        if (showDivider) const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}

class _SavedBuildTile extends StatefulWidget {
  const _SavedBuildTile({required this.build, required this.database});

  final SavedBuildRecord build;
  final AppDatabase database;

  @override
  State<_SavedBuildTile> createState() => _SavedBuildTileState();
}

class _SavedBuildTileState extends State<_SavedBuildTile> {
  late Future<List<SavedBuildItemRecord>> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.database.itemsForBuild(widget.build.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(widget.build.name),
        subtitle: Text(_formatDate(widget.build.createdAt)),
        children: [
          FutureBuilder<List<SavedBuildItemRecord>>(
            future: _items,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ListTile(
                  title: Text('Items could not be loaded: ${snapshot.error}'),
                );
              }
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                );
              }

              final items = [...snapshot.data!]
                ..sort(
                  (a, b) => _slotOrder(a.slot).compareTo(_slotOrder(b.slot)),
                );
              return Column(
                children: [
                  for (final item in items)
                    ListTile(
                      dense: true,
                      leading: Image.asset(
                        item.assetPath,
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported_outlined),
                      ),
                      title: Text('${_slotLabel(item.slot)}: ${item.itemName}'),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BuildMessage extends StatelessWidget {
  const _BuildMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Text(message)),
    );
  }
}

String _slotLabel(String value) {
  return switch (value) {
    'helm' => 'Helm',
    'body' => 'Body',
    'legs' => 'Legs',
    'weapon' => 'Weapon',
    _ => value,
  };
}

int _slotOrder(String value) {
  return switch (value) {
    'helm' => 0,
    'body' => 1,
    'legs' => 2,
    'weapon' => 3,
    _ => 4,
  };
}

String _formatDate(DateTime value) {
  final date = value.toLocal();
  String twoDigits(int number) => number.toString().padLeft(2, '0');
  return '${date.year}-${twoDigits(date.month)}-${twoDigits(date.day)} '
      '${twoDigits(date.hour)}:${twoDigits(date.minute)}';
}
