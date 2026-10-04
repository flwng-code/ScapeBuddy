import 'package:flutter/material.dart';

import '../data/boss_guides.dart';
import '../models/boss_guide.dart';
import 'boss_detail_screen.dart';

/// Shows the boss list; tapping a row opens that boss's guide.
class BestiaryScreen extends StatelessWidget {
  const BestiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Bestiary')),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: bossGuides.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BOSS GUIDES',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Choose a boss to read its attacks, mechanics, and guide.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          final guide = bossGuides[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _BossGuideTile(guide: guide),
          );
        },
      ),
    );
  }
}

class _BossGuideTile extends StatelessWidget {
  const _BossGuideTile({required this.guide});

  final BossGuide guide;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => BossDetailScreen(guide: guide),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Image.asset(
                guide.iconAsset,
                width: 32,
                height: 32,
                semanticLabel: '${guide.name} icon',
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.image_not_supported_outlined, size: 22),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      guide.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Color(0xFF717171)),
            ],
          ),
        ),
      ),
    );
  }
}
