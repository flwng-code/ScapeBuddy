import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    // The phone preview keeps the web app close to the mockup's screen size.
    DevicePreview(
      enabled: true,
      builder: (context) => const ScapeBuddyApp(),
    ),
  );
}

/// Sets up the shared theme and the first screen of ScapeBuddy.
class ScapeBuddyApp extends StatelessWidget {
  const ScapeBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScapeBuddy',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

/// A static starting screen for the three main parts of the project.
///
/// These cards are only a visual draft right now; the screens and navigation
/// will be added as later roadmap checkpoints are completed.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScapeBuddy'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
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

/// A small reusable card so each home destination uses the same layout.
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
