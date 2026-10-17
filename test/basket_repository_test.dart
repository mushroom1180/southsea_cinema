import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'movie-1',
  title: 'Test Movie 1',
  ageRating: '12A',
  synopsis: 'Test synopsis',
  screeningTime: '18:00',
  imagePath: 'assets/images/test.jpg',
  price: 6.00,
);

const Movie testMovie2 = Movie(
  id: 'movie-2',
  title: 'Test Movie 2',
  ageRating: '15',
  synopsis: 'Test synopsis',
  screeningTime: '20:00',
  imagePath: 'assets/images/test.jpg',
  price: 7.50,
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  test('starts with an empty basket and zero total', () {
    final BasketRepository basket = BasketRepository.instance;

    expect(basket.getItems().length, 0);
    expect(basket.getTotal(), 0.0);
  });

  test('adds items and calculates total correctly', () {
    final BasketRepository basket = BasketRepository.instance;

    const TicketItem item1 = TicketItem(
      movie: testMovie1,
      quantity: 2,
    );

    const TicketItem item2 = TicketItem(
      movie: testMovie2,
      quantity: 1,
    );

    basket.addItem(item1);
    basket.addItem(item2);

    expect(basket.getItems().length, 2);
    expect(basket.getTotal(), 19.50);
  });

  test('removes items correctly', () {
    final BasketRepository basket = BasketRepository.instance;

    const TicketItem item = TicketItem(
      movie: testMovie1,
      quantity: 1,
    );

    basket.addItem(item);

    expect(basket.getItems().length, 1);

    basket.removeItem(0);

    expect(basket.getItems().length, 0);
    expect(basket.getTotal(), 0.0);
  });

  test('clears all items correctly', () {
    final BasketRepository basket = BasketRepository.instance;

    const TicketItem item1 = TicketItem(
      movie: testMovie1,
      quantity: 2,
    );

    const TicketItem item2 = TicketItem(
      movie: testMovie2,
      quantity: 1,
    );

    basket.addItem(item1);
    basket.addItem(item2);

    expect(basket.getItems().length, 2);

    basket.clear();

    expect(basket.getItems().length, 0);
    expect(basket.getTotal(), 0.0);
  });
}
