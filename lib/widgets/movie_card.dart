import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

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
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '(${movie.ageRating})',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 22,
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '(${movie.ageRating})',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 22,
                      ),
                    ),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 25),

          // Poster and synopsis
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      movie.imagePath,
                      width: 140,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        movie.synopsis,
                        style: const TextStyle(
                          color: cinemaFontWhite,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      movie.imagePath,
                      width: 140,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      movie.synopsis,
                      style: const TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                  ],
                );
              }
            },
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
              PrimaryButton(
                label: 'BOOK NOW',
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
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
