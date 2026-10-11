import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns at least two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length >= 2, true);
    });

    test('movies contain valid data', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      for (final movie in movies) {
        expect(movie.id, isNotEmpty);
        expect(movie.title, isNotEmpty);
        expect(movie.ageRating, isNotEmpty);
        expect(movie.price > 0, true);
      }
    });

    test('movies have unique ids', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies[0].id == movies[1].id, false);
    });

    test('getMovieById returns movie for existing id', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('f1');

      expect(movie?.id, 'f1');
      expect(movie?.title, 'F1 THE MOVIE (2025)');
    });

    test('getMovieById returns null for missing id', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('missing');

      expect(movie, null);
    });

    test('getMoviesByAgeRating returns matching movies', () {
      final MovieRepository repository = MovieRepository();

      final List<Movie> movies = repository.getMoviesByAgeRating('12A');

      expect(movies.length, 1);
      expect(movies[0].id, 'f1');
      expect(movies[0].ageRating, '12A');
    });

    test('getMoviesUnderPrice returns movies within maximum price', () {
      final MovieRepository repository = MovieRepository();

      final List<Movie> movies = repository.getMoviesUnderPrice(7.00);

      expect(movies.length, 1);
      expect(movies[0].id, 'the-conjuring');
      expect(movies[0].price <= 7.00, true);
    });
  });
}
