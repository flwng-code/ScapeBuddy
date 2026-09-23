import 'package:flutter/material.dart';

// This small home draft gives Flutter a real screen to launch. The image-led
// cards and navigation from the mockup can be added in the screen-design step.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScapeBuddy'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          SizedBox(height: 24),
          _HomeFeatureCard(
            title: 'Bestiary',
            description: 'THIS WILL BE THE BESTIARY DESC',
          ),
          SizedBox(height: 12),
          _HomeFeatureCard(
            title: 'Build Maker',
            description: 'THIS WILL BE THE BUILD MAKER/LOADOUT DESC',
          ),
          SizedBox(height: 12),
          _HomeFeatureCard(
            title: 'Milestone Notes',
            description: 'THIS WILL BE THE MILSTONE NOTEPAD DESC',
          ),
        ],
      ),
    );
  }
}

// A temporary reusable card keeps the starter screen readable without adding
// navigation or feature behavior yet.
class _HomeFeatureCard extends StatelessWidget {
  const _HomeFeatureCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
