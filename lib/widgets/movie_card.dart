import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Movie title and age rating
          Row(
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  color: cinemaBrand,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 10),

              Text(
                '(${movie.ageRating})',
                style: const TextStyle(
                  color: cinemaFontMuted,
                  fontSize: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // Poster and synopsis
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                movie.imagePath,
                width: 140,
                height: 210,
                fit: BoxFit.cover,
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Text(
                  movie.synopsis,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'BOOK TICKETS',
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 30),

          // Screening time and booking button
          Row(
            children: [
              Expanded(
                child: Text(
                  movie.screeningTime,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 20,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 18,
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MovieListing(
                          movie: movie,
                        );
                      },
                    ),
                  );
                },

                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}