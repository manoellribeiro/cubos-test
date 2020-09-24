import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> getMovieDetails(int movieId);
}