import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:dio/dio.dart';
class DiscoverMoviesRemoteDataSourceImplementation implements DiscoverMoviesRemoteDataSource {
  
  final Dio dio;

  DiscoverMoviesRemoteDataSourceImplementation(this.dio);
  
  
  @override
  Future<DiscoverMoviesApiResponse> getMoviesList(int genreId, int pageNumber) {
    
  }

}