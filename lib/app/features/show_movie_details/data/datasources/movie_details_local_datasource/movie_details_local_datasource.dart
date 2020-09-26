import '../../../domain/entities/MovieDetails.dart';

abstract class MovieDetailsLocalDataSource {
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<void> storeMovieDetails(MovieDetails movieDetails);
}
