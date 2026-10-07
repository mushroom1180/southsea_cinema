import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'f1',
        title: 'F1 THE MOVIE (2025)',
        ageRating: '12A',
        synopsis:
            'Racing veteran Sonny Hayes returns to Formula 1 to help save '
            'a struggling team while mentoring talented rookie Joshua Pierce.',
        screeningTime: 'Saturday 26 Sep 2026, 18:00',
        imagePath: 'assets/images/f1.jpg',
      ),
      Movie(
        id: 'the-conjuring',
        title: 'THE CONJURING (2013)',
        ageRating: '15',
        synopsis:
            'Pananormal investigators Ed and Lorraine Warren help a family '
            'terrorized by a dark presence in their farmhouse.',
        screeningTime: 'Sunday 27 Sep 2026, 20:00',
        imagePath: 'assets/images/conjuring.jpeg',
      ),
    ];
  }
}
