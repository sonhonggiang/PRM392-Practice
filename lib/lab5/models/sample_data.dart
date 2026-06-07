import 'movie_model.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Interstellar',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
    overview: 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.',
    genres: ['Adventure', 'Drama', 'Sci-Fi'],
    rating: 8.7,
    trailers: ['Official Trailer 1', 'Official Trailer 2', 'Teaser Trailer'],
  ),
  Movie(
    id: 2,
    title: 'The Dark Knight',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    overview: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    genres: ['Action', 'Crime', 'Drama'],
    rating: 9.0,
    trailers: ['Main Trailer', 'Teaser'],
  ),
  Movie(
    id: 3,
    title: 'Inception',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    overview: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
    genres: ['Action', 'Adventure', 'Sci-Fi'],
    rating: 8.8,
    trailers: ['Inception Trailer 1', 'Inception Trailer 2', 'Behind the Scenes'],
  ),
];
