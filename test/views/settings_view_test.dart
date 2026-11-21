import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });

  testWidgets(
    'SettingsView displays form fields and switch',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Customer Profile'),
        findsOneWidget,
      );

      expect(
        find.byType(TextField),
        findsNWidgets(3),
      );

      expect(
        find.byType(Switch),
        findsNWidgets(2),
      );

      expect(
        find.text('Save Settings'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Theme choice is saved and applied only when settings are saved',
    (WidgetTester tester) async {
      ThemeMode? appliedThemeMode;

      await tester.pumpWidget(
        MaterialApp(
          home: SettingsView(
            themeMode: ThemeMode.dark,
            onThemeModeChanged: (ThemeMode themeMode) {
              appliedThemeMode = themeMode;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Finder themeSwitch = find.byKey(const Key('theme_mode_switch'));
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();

      expect(tester.widget<Switch>(themeSwitch).value, isFalse);

      await tester.tap(themeSwitch);
      await tester.pump();

      expect(tester.widget<Switch>(themeSwitch).value, isTrue);
      expect(appliedThemeMode, isNull);
      expect(await prefs.getString(prefThemeMode), isNull);

      await tester.tap(find.text('Save Settings'));
      await tester.pumpAndSettle();

      expect(await prefs.getString(prefThemeMode), 'light');
      expect(appliedThemeMode, ThemeMode.light);
    },
  );

  testWidgets(
    'Toggling switch and saving settings updates state',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      final Finder nameField = find.widgetWithText(
        TextField,
        'Full name',
      );

      final Finder addressField = find.widgetWithText(
        TextField,
        'Delivery address',
      );

      final Finder emailField = find.widgetWithText(
        TextField,
        'Email address',
      );

      await tester.enterText(
        nameField,
        'Gerald Vernon-Jackson',
      );

      await tester.enterText(
        addressField,
        'Guildhall, PO1 2AJ',
      );

      await tester.enterText(
        emailField,
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );

      final Finder switchFinder = find.byType(Switch).first;

      expect(
        tester.widget<Switch>(switchFinder).value,
        isFalse,
      );

      await tester.tap(switchFinder);
      await tester.pump();

      expect(
        tester.widget<Switch>(switchFinder).value,
        isTrue,
      );

      await tester.tap(
        find.text('Save Settings'),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Settings saved for Gerald Vernon-Jackson'),
        findsOneWidget,
      );

      final SharedPreferencesAsync prefs = SharedPreferencesAsync();

      expect(
        await prefs.getString(prefName),
        'Gerald Vernon-Jackson',
      );

      expect(
        await prefs.getString(prefAddress),
        'Guildhall, PO1 2AJ',
      );

      expect(
        await prefs.getString(prefEmail),
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );

      expect(
        await prefs.getBool(prefNewsletter),
        isTrue,
      );

      await tester.pumpWidget(
        const SizedBox.shrink(),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Gerald Vernon-Jackson'),
        findsOneWidget,
      );

      expect(
        find.text('Guildhall, PO1 2AJ'),
        findsOneWidget,
      );

      expect(
        find.text('gerald.vernon-jackson@portsmouthcc.gov.uk'),
        findsOneWidget,
      );

      final Switch reopenedSwitch =
          tester.widget<Switch>(find.byType(Switch).first);

      expect(
        reopenedSwitch.value,
        isTrue,
      );
    },
  );

  testWidgets(
    'SettingsView pre-fills saved settings on open',
    (WidgetTester tester) async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(
        <String, Object>{
          prefName: 'Abdul Kadir',
          prefAddress: 'Portsmouth Guildhall, PO1 2AJ',
          prefEmail: 'abdul.kadir@portsmouthcc.gov.uk',
          prefNewsletter: true,
          prefThemeMode: 'light',
        },
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Abdul Kadir'),
        findsOneWidget,
      );

      expect(
        find.text('Portsmouth Guildhall, PO1 2AJ'),
        findsOneWidget,
      );

      expect(
        find.text('abdul.kadir@portsmouthcc.gov.uk'),
        findsOneWidget,
      );

      final Switch switchWidget =
          tester.widget<Switch>(find.byType(Switch).first);

      expect(
        switchWidget.value,
        isTrue,
      );

      final Switch themeSwitch = tester.widget<Switch>(
        find.byKey(const Key('theme_mode_switch')),
      );

      expect(
        themeSwitch.value,
        isTrue,
      );
    },
  );
}
