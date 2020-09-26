import '../../../domain/entities/MovieDetails.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> getMovieDetails(int movieId);
}
