import 'package:flutter/material.dart';

import '../../../core/database/app_database.dart';

/// Lets the user save short project milestones locally on this device.
class MilestoneNotesScreen extends StatefulWidget {
  const MilestoneNotesScreen({super.key});

  @override
  State<MilestoneNotesScreen> createState() => _MilestoneNotesScreenState();
}

class _MilestoneNotesScreenState extends State<MilestoneNotesScreen> {
  final AppDatabase _database = AppDatabase.instance;
  final TextEditingController _noteController = TextEditingController();
  late Future<List<NoteRecord>> _notes;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _notes = _database.getNotes();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final note = _noteController.text.trim();
    if (note.isEmpty || _isSaving) return;

    setState(() => _isSaving = true);
    try {
      await _database.addNote(note);
      if (!mounted) return;
      setState(() {
        _notes = _database.getNotes();
      });
      _noteController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note saved on this device.')),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save this note: $error')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Milestone Notes')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'NEW NOTE',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _noteController,
            minLines: 4,
            maxLines: 6,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: 'Write a milestone or a note...',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: _isSaving ? null : _saveNote,
                  child: Text(_isSaving ? 'Saving...' : 'Save'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: _isSaving ? null : _noteController.clear,
                  child: const Text('Clear'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'SAVED NOTES',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          FutureBuilder<List<NoteRecord>>(
            future: _notes,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return _NotesMessage(
                  message: 'Notes could not be loaded: ${snapshot.error}',
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

              final notes = snapshot.data!;
              if (notes.isEmpty) {
                return const _NotesMessage(
                  message: 'Your saved notes will appear here.',
                );
              }

              return Column(
                children: [
                  for (final note in notes)
                    Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        title: Text(note.content),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(_formatDate(note.createdAt)),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime value) {
    final date = value.toLocal();
    String twoDigits(int number) => number.toString().padLeft(2, '0');
    return '${date.year}-${twoDigits(date.month)}-${twoDigits(date.day)} '
        '${twoDigits(date.hour)}:${twoDigits(date.minute)}';
  }
}

class _NotesMessage extends StatelessWidget {
  const _NotesMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Text(message)),
    );
  }
}
