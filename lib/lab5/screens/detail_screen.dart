import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần đầu: Hero Banner sử dụng Stack và Gradient
            Stack(
              children: [
                Hero(
                  tag: 'movie-poster-${widget.movie.id}',
                  child: Image.network(
                    widget.movie.posterUrl,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // Phần thông tin: Genres
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: widget.movie.genres.map((genre) {
                  return Chip(
                    label: Text(genre),
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Phần nội dung: Overview
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.movie.overview,
                style: const TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),

            // Nút chức năng: Favorite, Rate, Share
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                    label: 'Favorite',
                    color: _isFavorite ? Colors.red : Colors.grey,
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.star_border,
                    label: 'Rate',
                    color: Colors.amber,
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.share,
                    label: 'Share',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const Divider(height: 32),

            // Phần dưới cùng: Trailers (Sử dụng ListView.builder)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Trailers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.movie.trailers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.play_circle_fill, color: Colors.red),
                  title: Text(widget.movie.trailers[index]),
                  onTap: () {},
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
