import 'package:flutter/material.dart';

/// A simple notes screen draft based on the supplied mockup.
class MilestoneNotesScreen extends StatelessWidget {
  const MilestoneNotesScreen({super.key});

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
          const TextField(
            minLines: 4,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Write a milestone or a note...',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: null,
                  child: const Text('Save'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: null,
                  child: const Text('Cancel'),
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
          const Card(
            child: ListTile(
              title: Text('Your notes will appear here'),
              subtitle: Text('Note saving is not connected yet.'),
            ),
          ),
        ],
      ),
    );
  }
}
