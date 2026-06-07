import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const MovieListScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> movies = [
    Movie(
      title: 'The Shawshank Redemption',
      year: '1994',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg',
    ),
    Movie(
      title: 'The Godfather',
      year: '1972',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
    ),
    Movie(
      title: 'The Dark Knight',
      year: '2008',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    ),
    Movie(
      title: 'Pulp Fiction',
      year: '1994',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjMyXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
    ),
    Movie(
      title: 'Schindler\'s List',
      year: '1993',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
    ),
    Movie(
      title: 'The Lord of the Rings: The Return of the King',
      year: '2003',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
    ),
    Movie(
      title: 'Inception',
      year: '2010',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    ),
    Movie(
      title: 'The Matrix',
      year: '1999',
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
    ),
  ];

  void _showSnackBar(String movieTitle) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected: $movieTitle'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List - Lab 4'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              widget.onThemeChanged(!widget.isDarkMode);
            },
            tooltip: 'Toggle Sáng/Tối',
          ),
          Switch(
            value: widget.isDarkMode,
            onChanged: (value) {
              widget.onThemeChanged(value);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(
              movie: movie,
              onTap: () => _showSnackBar(movie.title),
            );
          },
        ),
      ),
    );
  }
}
