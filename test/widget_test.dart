import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  group('Southsea Cinema widget tests', () {
    testWidgets(
      'Home page displays title, movies and booking buttons',
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
  });
}