import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns the mock movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);

      expect(movies[0].id, 'f1');
      expect(movies[0].title, 'F1 THE MOVIE (2025)');

      expect(movies[1].id, 'the-conjuring');
      expect(movies[1].title, 'THE CONJURING (2013)');
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
  });
}