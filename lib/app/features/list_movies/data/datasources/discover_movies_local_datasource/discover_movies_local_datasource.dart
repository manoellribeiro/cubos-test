import '../../../domain/entities/DiscoverMoviesApiResponse.dart';

abstract class DiscoverMoviesLocalDataSource {
  Future<DiscoverMoviesApiResponse> getLastDiscoverMoviesApiResponse(
      int genreId);
  Future<void> storeLastDiscoverMoviesApiResponse(
      DiscoverMoviesApiResponse lastDiscoverMoviesApiResponse, int genreId);
}
