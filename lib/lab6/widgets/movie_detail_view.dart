import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailView extends StatelessWidget {
  final Movie? movie;

  const MovieDetailView({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return const Center(
        child: Text(
          'Select a movie to see details',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    final selectedMovie = movie!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                selectedMovie.posterUrl,
                height: 400,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.movie, size: 100),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            selectedMovie.title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text('${selectedMovie.year}', style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 16),
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text('${selectedMovie.rating}', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: selectedMovie.genres.map((genre) {
              return Chip(label: Text(genre));
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Overview',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            selectedMovie.overview,
            style: const TextStyle(fontSize: 16, height: 1.6),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
