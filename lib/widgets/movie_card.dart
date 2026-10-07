import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.imagePath,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.title} (${movie.ageRating})',

                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                  
                  Text(
                    movie.synopsis,
                    style: const TextStyle(
                      color: cinemaFontMuted,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    movie.screeningTime,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Book'),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}