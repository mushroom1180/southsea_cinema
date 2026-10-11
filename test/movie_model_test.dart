import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        ageRating: '12A',
        synopsis: 'This is a test movie.',
        screeningTime: 'Saturday 10 Oct 2026, 18:00',
        imagePath: 'assets/images/test.jpg',
        price: 6.00,
      );

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.ageRating, '12A');
      expect(movie.synopsis, 'This is a test movie.');
      expect(movie.screeningTime, 'Saturday 10 Oct 2026, 18:00');
      expect(movie.imagePath, 'assets/images/test.jpg');
      expect(movie.price, 6.00);
    });

    test('formattedPrice returns price with pound sign and two decimals', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        ageRating: '12A',
        synopsis: 'This is a test movie.',
        screeningTime: 'Saturday 10 Oct 2026, 18:00',
        imagePath: 'assets/images/test.jpg',
        price: 6.0,
      );

      expect(movie.formattedPrice, '£6.00');
    });

    test('isChildFriendly returns true for U rating', () {
      const movie = Movie(
        id: 'u-movie',
        title: 'U Movie',
        ageRating: 'U',
        synopsis: 'Test',
        screeningTime: '10:00',
        imagePath: 'assets/images/test.jpg',
        price: 5.00,
      );

      expect(movie.isChildFriendly, true);
    });

    test('isChildFriendly returns true for PG rating', () {
      const movie = Movie(
        id: 'pg-movie',
        title: 'PG Movie',
        ageRating: 'PG',
        synopsis: 'Test',
        screeningTime: '10:00',
        imagePath: 'assets/images/test.jpg',
        price: 5.00,
      );

      expect(movie.isChildFriendly, true);
    });

    test('isChildFriendly returns false for 12A rating', () {
      const movie = Movie(
        id: '12a-movie',
        title: '12A Movie',
        ageRating: '12A',
        synopsis: 'Test',
        screeningTime: '10:00',
        imagePath: 'assets/images/test.jpg',
        price: 5.00,
      );

      expect(movie.isChildFriendly, false);
    });

    test('isAdultOnly returns true for 18 rating', () {
      const movie = Movie(
        id: 'adult-movie',
        title: 'Adult Movie',
        ageRating: '18',
        synopsis: 'Test',
        screeningTime: '21:00',
        imagePath: 'assets/images/test.jpg',
        price: 8.00,
      );

      expect(movie.isAdultOnly, true);
    });

    test('isAdultOnly returns false for 15 rating', () {
      const movie = Movie(
        id: '15-movie',
        title: '15 Movie',
        ageRating: '15',
        synopsis: 'Test',
        screeningTime: '20:00',
        imagePath: 'assets/images/test.jpg',
        price: 7.00,
      );

      expect(movie.isAdultOnly, false);
    });
  });
}