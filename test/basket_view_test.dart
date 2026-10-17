import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'movie-1',
  title: 'Test Movie',
  ageRating: '12A',
  synopsis: 'Test synopsis',
  screeningTime: '18:00',
  imagePath: 'assets/images/test.jpg',
  price: 6.00,
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets(
    'BasketView displays empty message when basket has no items',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BasketView(),
        ),
      );

      expect(
        find.text('Your basket is empty'),
        findsOneWidget,
      );

      expect(
        find.text('BUY TICKETS'),
        findsNothing,
      );
    },
  );

  testWidgets(
    'BasketView renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      const TicketItem item = TicketItem(
        movie: testMovie,
        quantity: 2,
      );

      BasketRepository.instance.addItem(item);

      await tester.pumpWidget(
        const MaterialApp(
          home: BasketView(),
        ),
      );

      expect(
        find.text('Your basket'),
        findsOneWidget,
      );

      expect(
        find.text('2 x Test Movie'),
        findsOneWidget,
      );

      expect(
        find.text('£12.00'),
        findsWidgets,
      );

      expect(
        find.text('BUY TICKETS'),
        findsOneWidget,
      );

      await tester.tap(
        find.byIcon(Icons.delete_outline),
      );

      await tester.pump();

      expect(
        find.text('Your basket is empty'),
        findsOneWidget,
      );
    },
  );
}
