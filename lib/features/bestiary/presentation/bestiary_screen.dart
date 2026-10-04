import 'package:flutter/material.dart';

/// A screen draft for the shared boss guide list.
class BestiaryScreen extends StatelessWidget {
  const BestiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bestiary')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'BOSS GUIDES',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 16),
          for (var guideNumber = 1; guideNumber <= 7; guideNumber++)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: ListTile(
                  title: Text('Boss guide $guideNumber'),
                  subtitle: const Text('Guide information will be added here.'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
