import 'package:flutter/material.dart';

import '../../bestiary/presentation/bestiary_screen.dart';
import '../../builds/presentation/build_creator_screen.dart';
import '../../notes/presentation/milestone_notes_screen.dart';

/// The home page uses large image cards as the main navigation.
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
        children: [
          _HomeFeatureCard(
            title: 'Bestiary',
            description: 'Browse boss guides and battle strategies.',
            imagePath: 'assets/images/bestiary.jpg',
            onTap: () => _openPage(context, const BestiaryScreen()),
          ),
          const SizedBox(height: 16),
          _HomeFeatureCard(
            title: 'Build Maker',
            description: 'Plan your gear and loadouts.',
            imagePath: 'assets/images/build_maker.jpg',
            onTap: () => _openPage(context, const BuildCreatorScreen()),
          ),
          const SizedBox(height: 16),
          _HomeFeatureCard(
            title: 'Milestone Notes',
            description: 'Keep notes about your goals and progress.',
            imagePath: 'assets/images/milestone_notes.jpg',
            onTap: () => _openPage(context, const MilestoneNotesScreen()),
          ),
        ],
      ),
    );
  }

  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}

/// A whole card can be tapped, so its image and text open the same page.
class _HomeFeatureCard extends StatelessWidget {
  const _HomeFeatureCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 190,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // This simple fallback stays visible until an image is added.
                  return const ColoredBox(color: Color(0xFF717171));
                },
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0xB8000000),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
