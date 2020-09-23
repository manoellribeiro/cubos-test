import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';

abstract class DiscoverMoviesRemoteDataSource {
  Future<DiscoverMoviesApiResponse> getMoviesList(int genreId, int pageNumber);
}