import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;

    if (cachedMovies != null) {
      return cachedMovies;
    }

    return const [
      Movie(
        id: 'f1',
        title: 'F1 THE MOVIE (2025)',
        ageRating: '12A',
        synopsis:
            'Racing veteran Sonny Hayes returns to Formula 1 to help save '
            'a struggling team while mentoring talented rookie Joshua Pearce.',
        screeningTime: 'Saturday 26 Sep 2026, 18:00',
        imagePath: 'assets/images/f1.jpg',
        price: 7.50,
      ),
      Movie(
        id: 'the-conjuring',
        title: 'THE CONJURING (2013)',
        ageRating: '15',
        synopsis:
            'Paranormal investigators Ed and Lorraine Warren help a family '
            'terrorized by a dark presence in their farmhouse.',
        screeningTime: 'Sunday 27 Sep 2026, 20:00',
        imagePath: 'assets/images/conjuring.jpeg',
        price: 6.50,
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;

      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;

    return loadedMovies;
  }
}
