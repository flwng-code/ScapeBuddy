import 'package:flutter/material.dart';

import '../models/boss_guide.dart';

/// Displays one boss's description, image space, attacks, and strategy.
class BossDetailScreen extends StatelessWidget {
  const BossDetailScreen({required this.guide, super.key});

  final BossGuide guide;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Bestiary')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guide.name,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _BossImageSlot(imageAsset: guide.heroImageAsset),
            const SizedBox(height: 24),
            _GuideSection(
              title: 'Description',
              items: [guide.description],
              listStyle: BossGuideListStyle.none,
            ),
            for (final section in guide.sections) ...[
              const SizedBox(height: 22),
              _GuideSection(
                title: section.title,
                items: section.items,
                listStyle: section.listStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BossImageSlot extends StatelessWidget {
  const _BossImageSlot({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: 220,
        child: Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const ColoredBox(
            color: Color(0xFFE7E7E7),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 42,
                    color: Color(0xFF717171),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Boss image space',
                    style: TextStyle(color: Color(0xFF4A4A4A)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GuideSection extends StatelessWidget {
  const _GuideSection({
    required this.title,
    required this.items,
    required this.listStyle,
  });

  final String title;
  final List<String> items;
  final BossGuideListStyle listStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        for (var index = 0; index < items.length; index++)
          Padding(
            padding: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 8),
            child: _GuideItem(
              text: items[index],
              listStyle: listStyle,
              index: index,
            ),
          ),
      ],
    );
  }
}

class _GuideItem extends StatelessWidget {
  const _GuideItem({
    required this.text,
    required this.listStyle,
    required this.index,
  });

  final String text;
  final BossGuideListStyle listStyle;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (listStyle == BossGuideListStyle.none) {
      return Text(text, style: Theme.of(context).textTheme.bodyMedium);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          child: listStyle == BossGuideListStyle.numbered
              ? Text('${index + 1}.')
              : const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.circle, size: 6, color: Color(0xFF717171)),
                ),
        ),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
