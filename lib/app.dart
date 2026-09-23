import 'package:flutter/material.dart';

import 'features/home/presentation/home_screen.dart';

// This is the root widget. Shared theme and navigation will grow here as
// screens are implemented in later checkpoints.
class ScapeBuddyApp extends StatelessWidget {
  const ScapeBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScapeBuddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          foregroundColor: Color(0xFFFFFFFF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
