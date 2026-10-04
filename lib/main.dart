import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';

void main() {
  runApp(
    // The preview keeps the web screen close to the phone mockup while I work.
    DevicePreview(
      enabled: true,
      builder: (context) => const ScapeBuddyApp(),
    ),
  );
}

/// Sets up the shared app settings and opens the home screen.
class ScapeBuddyApp extends StatelessWidget {
  const ScapeBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScapeBuddy',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.light(),
      home: const HomeScreen(),
    );
  }
}
