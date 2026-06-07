import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            movie.posterUrl,
            width: 60,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 90,
                color: Colors.grey[300],
                child: const Icon(Icons.movie, color: Colors.grey),
              );
            },
          ),
        ),
        title: Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Year: ${movie.year}',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.info_outline, color: Colors.blueAccent),
        onTap: onTap,
      ),
    );
  }
}
