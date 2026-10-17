import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  group('Southsea Cinema widget tests', () {
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
      'Booking button opens listing and Add to order shows feedback',
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

        await tester.tap(
          find.text('ADD TO ORDER'),
        );

        await tester.pump();

        expect(
          find.text('0 ticket(s) added to your order'),
          findsOneWidget,
        );
      },
    );
  });
}