import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../models/sample_data.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies - Lab 5'),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  movie.posterUrl,
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Rating: ${movie.rating}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
