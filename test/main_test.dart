import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  setUp(() {
    rootBundle.clear();
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });

  group('Southsea Cinema widget tests', () {
    testWidgets(
      'App defaults to dark theme',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const SouthseaCinemaApp(),
        );

        await tester.pumpAndSettle();

        final MaterialApp app = tester.widget<MaterialApp>(
          find.byType(MaterialApp),
        );

        expect(app.themeMode, ThemeMode.dark);
      },
    );

    testWidgets(
      'App restores saved light theme',
      (WidgetTester tester) async {
        SharedPreferencesAsyncPlatform.instance =
            InMemorySharedPreferencesAsync.withData(
          <String, Object>{prefThemeMode: 'light'},
        );

        await tester.pumpWidget(
          const SouthseaCinemaApp(),
        );

        await tester.pumpAndSettle();

        final MaterialApp app = tester.widget<MaterialApp>(
          find.byType(MaterialApp),
        );

        expect(app.themeMode, ThemeMode.light);
      },
    );

    testWidgets(
      'App restores saved dark theme',
      (WidgetTester tester) async {
        SharedPreferencesAsyncPlatform.instance =
            InMemorySharedPreferencesAsync.withData(
          <String, Object>{prefThemeMode: 'dark'},
        );

        await tester.pumpWidget(
          const SouthseaCinemaApp(),
        );

        await tester.pumpAndSettle();

        final MaterialApp app = tester.widget<MaterialApp>(
          find.byType(MaterialApp),
        );

        expect(app.themeMode, ThemeMode.dark);
      },
    );

    testWidgets(
      'Home page displays title, movie cards and booking buttons',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const SouthseaCinemaApp(),
        );

        await tester.pumpAndSettle();

        expect(
          find.text('Southsea Cinema'),
          findsOneWidget,
        );

        expect(
          find.text('F1 THE MOVIE (2025)'),
          findsOneWidget,
        );

        expect(
          find.text('THE CONJURING (2013)'),
          findsOneWidget,
        );

        expect(
          find.text('BOOK NOW'),
          findsNWidgets(2),
        );
      },
    );

    testWidgets(
      'Booking button opens listing',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const SouthseaCinemaApp(),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text('BOOK NOW').first,
        );

        await tester.pumpAndSettle();

        expect(
          find.text('F1 THE MOVIE (2025) (12A)'),
          findsOneWidget,
        );

        expect(
          find.text('Saturday 26 Sep 2026, 18:00'),
          findsOneWidget,
        );
      },
    );
  });
}
