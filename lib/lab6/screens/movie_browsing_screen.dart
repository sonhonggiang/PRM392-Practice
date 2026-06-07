import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../models/sample_data.dart';
import '../widgets/movie_detail_view.dart';

class MovieBrowsingScreen extends StatefulWidget {
  const MovieBrowsingScreen({super.key});

  @override
  State<MovieBrowsingScreen> createState() => _MovieBrowsingScreenState();
}

class _MovieBrowsingScreenState extends State<MovieBrowsingScreen> {
  String _searchQuery = '';
  String _selectedGenre = 'All';
  String _sortBy = 'A-Z';
  Movie? _selectedMovie;

  final List<String> _sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

  List<Movie> get _filteredMovies {
    List<Movie> filtered = sampleMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesGenre = _selectedGenre == 'All' || movie.genres.contains(_selectedGenre);
      return matchesSearch && matchesGenre;
    }).toList();

    switch (_sortBy) {
      case 'A-Z':
        filtered.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z-A':
        filtered.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
        filtered.sort((a, b) => b.year.compareTo(a.year));
        break;
      case 'Rating':
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Browser - Lab 6'),
        elevation: 2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            // Mobile Layout (Single Column)
            return _buildMovieList();
          } else {
            // Tablet/Web Layout (Split-View)
            return Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: _buildMovieList(isSplitView: true),
                  ),
                ),
                Expanded(
                  child: MovieDetailView(movie: _selectedMovie),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildMovieList({bool isSplitView = false}) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search movies...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),

        // Genre Filter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: allGenres.map((genre) {
              final isSelected = _selectedGenre == genre;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(genre),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedGenre = genre;
                      });
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // Sort Dropdown
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Text('Sort by:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButton<String>(
                  value: _sortBy,
                  isExpanded: true,
                  items: _sortOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _sortBy = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // Movie List
        Expanded(
          child: ListView.builder(
            itemCount: _filteredMovies.length,
            itemBuilder: (context, index) {
              final movie = _filteredMovies[index];
              final isSelected = _selectedMovie?.id == movie.id && isSplitView;

              return ListTile(
                selected: isSelected,
                selectedTileColor: Colors.blue.withOpacity(0.1),
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
                subtitle: Text('${movie.year} • ${movie.rating} ⭐'),
                onTap: () {
                  if (isSplitView) {
                    setState(() {
                      _selectedMovie = movie;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(movie.title)),
                          body: MovieDetailView(movie: movie),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
