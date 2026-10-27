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

    test('Movie converts from and to JSON correctly', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'f1',
        'title': 'F1 THE MOVIE (2025)',
        'ageRating': '12A',
        'synopsis': 'Test synopsis',
        'screeningTime': '18:00',
        'imagePath': 'assets/images/f1.jpg',
        'price': 7.5,
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.id, 'f1');
      expect(movie.title, 'F1 THE MOVIE (2025)');
      expect(movie.ageRating, '12A');
      expect(movie.synopsis, 'Test synopsis');
      expect(movie.screeningTime, '18:00');
      expect(movie.imagePath, 'assets/images/f1.jpg');
      expect(movie.price, 7.5);

      expect(movie.toJson(), json);
    });

    test('Movie.fromJson converts whole-number price to double', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'test-movie',
        'title': 'Test Movie',
        'ageRating': '12A',
        'synopsis': 'Test synopsis',
        'screeningTime': '18:00',
        'imagePath': 'assets/images/test.jpg',
        'price': 6,
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.price, 6.0);
      expect(movie.price, isA<double>());
    });
  });
}
