import '../../../domain/entities/DiscoverMoviesApiResponse.dart';

abstract class DiscoverMoviesRemoteDataSource {
  Future<DiscoverMoviesApiResponse> getMoviesList(int genreId, int pageNumber);
}
