import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
abstract class DiscoverMoviesLocalDataSource {
  
  Future<DiscoverMoviesApiResponse> getLastDiscoverMoviesApiResponse(int genreId);
  Future<void> storeLastDiscoverMoviesApiResponse(DiscoverMoviesApiResponse lastDiscoverMoviesApiResponse, int genreId);

}
