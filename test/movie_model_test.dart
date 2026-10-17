import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        ageRating: '12A',
        synopsis: 'Test synopsis',
        screeningTime: '18:00',
        imagePath: 'assets/images/test.jpg',
        price: 6.00,
      );

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.ageRating, '12A');
      expect(movie.synopsis, 'Test synopsis');
      expect(movie.screeningTime, '18:00');
      expect(movie.imagePath, 'assets/images/test.jpg');
      expect(movie.price, 6.00);
    });

    test('formattedPrice formats whole-pound price', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        ageRating: '12A',
        synopsis: 'Test synopsis',
        screeningTime: '18:00',
        imagePath: 'assets/images/test.jpg',
        price: 6.00,
      );

      expect(movie.formattedPrice, '£6.00');
    });

    test('formattedPrice formats price with pence', () {
      const movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        ageRating: '12A',
        synopsis: 'Test synopsis',
        screeningTime: '18:00',
        imagePath: 'assets/images/test.jpg',
        price: 7.50,
      );

      expect(movie.formattedPrice, '£7.50');
    });
  });
}