import 'movie_model.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Interstellar',
    year: 2014,
    rating: 8.7,
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
    overview: 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.',
  ),
  Movie(
    id: 2,
    title: 'The Dark Knight',
    year: 2008,
    rating: 9.0,
    genres: ['Action', 'Crime', 'Drama'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    overview: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
  ),
  Movie(
    id: 3,
    title: 'Inception',
    year: 2010,
    rating: 8.8,
    genres: ['Action', 'Sci-Fi', 'Adventure'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    overview: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
  ),
  Movie(
    id: 4,
    title: 'Pulp Fiction',
    year: 1994,
    rating: 8.9,
    genres: ['Crime', 'Drama'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjMyXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
    overview: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
  ),
  Movie(
    id: 5,
    title: 'The Matrix',
    year: 1999,
    rating: 8.7,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
    overview: 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
  ),
  Movie(
    id: 6,
    title: 'The Godfather',
    year: 1972,
    rating: 9.2,
    genres: ['Crime', 'Drama'],
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
    overview: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
  ),
];

final List<String> allGenres = ['All', 'Action', 'Adventure', 'Sci-Fi', 'Drama', 'Crime'];
