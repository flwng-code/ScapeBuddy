import 'package:flutter/material.dart';

/// The first layout draft for the gear build screen.
class BuildCreatorScreen extends StatelessWidget {
  const BuildCreatorScreen({super.key});

  // The mockup shows 11 spaces, while the proposal says 12.
  static const int _visibleSlotCount = 11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Build Maker')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Build name',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'EQUIPPED SLOTS  0/$_visibleSlotCount',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _visibleSlotCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF717171)),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text('Slot ${index + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
