import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
//import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String _orderMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaBackground,
        iconTheme: const IconThemeData(
          color: cinemaBrand,
        ),
        elevation: 0,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWideScreen = constraints.maxWidth >= 600;

          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: cinemaBackground,
              padding: EdgeInsets.all(
                isWideScreen ? 32 : 20,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title and age rating
                  Text(
                    '${widget.movie.title} (${widget.movie.ageRating})',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: isWideScreen ? 36 : 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(
                    height: isWideScreen ? 55 : 35,
                  ),

                  // Cinema room
                  const Text(
                    'Southsea Cinema Room',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Screening time
                  Text(
                    widget.movie.screeningTime,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Information
                  const Text(
                    'Please note that Discounts / Membership Benefits '
                    'will be applied once you have selected your tickets',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Select Quantities (Up to 5 in total)',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Tickets heading
                  const Text(
                    'Tickets',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Responsive ticket section
                  if (isWideScreen)
                    Row(
                      children: [
                        _buildDropdown(),

                        const SizedBox(width: 20),

                        const Text(
                          'Adult (£7.50)',
                          style: TextStyle(
                            color: cinemaFontWhite,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDropdown(),

                        const SizedBox(height: 15),

                        const Text(
                          'Adult (£7.50)',
                          style: TextStyle(
                            color: cinemaFontWhite,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 40),

                  // Add to order button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaBrand,
                      foregroundColor: cinemaFontWhite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 18,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),

                    onPressed: () {
                      setState(() {
                        _orderMessage =
                            '$_ticketQuantity ticket(s) added to your order';
                      });
                    },

                    child: const Text(
                      'ADD TO ORDER',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Order confirmation text
                  Text(
                    _orderMessage,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown() {
    return SizedBox(
      width: 140,

      child: DropdownMenu<int>(
        initialSelection: 0,

        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),

        onSelected: (int? value) {
          if (value != null) {
            setState(() {
              _ticketQuantity = value;
            });
          }
        },

        dropdownMenuEntries: const [
          DropdownMenuEntry(
            value: 0,
            label: '0',
          ),
          DropdownMenuEntry(
            value: 1,
            label: '1',
          ),
          DropdownMenuEntry(
            value: 2,
            label: '2',
          ),
          DropdownMenuEntry(
            value: 3,
            label: '3',
          ),
          DropdownMenuEntry(
            value: 4,
            label: '4',
          ),
          DropdownMenuEntry(
            value: 5,
            label: '5',
          ),
        ],
      ),
    );
  }
}