// A widget test: it builds your app in memory and checks what is on screen.
// Run them all with: flutter test
//
// You are not required to write more of these, but a project with a few real
// tests reads very differently from one with none.

import 'package:flutter_test/flutter_test.dart';

import 'package:scapebuddy/main.dart';

void main() {
  testWidgets('home screen shows the three project areas', (tester) async {
    // Build the app directly so the test does not need the preview toolbar.
    await tester.pumpWidget(const ScapeBuddyApp());

    expect(find.text('ScapeBuddy'), findsOneWidget);
    expect(find.text('Bestiary'), findsOneWidget);
    expect(find.text('Build Maker'), findsOneWidget);
    expect(find.text('Milestone Notes'), findsOneWidget);
  });
}
