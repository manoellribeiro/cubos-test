import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
abstract class DiscoverMoviesLocalDataSource {
  Future<DiscoverMoviesApiResponse> getMoviesList(int genreId);
}
