import 'package:cubos_test/app/core/errors/exceptions/server_exception.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:dio/dio.dart';
class DiscoverMoviesRemoteDataSourceImplementation implements DiscoverMoviesRemoteDataSource {
  
  final Dio dio;

  DiscoverMoviesRemoteDataSourceImplementation({this.dio});

  @override
  Future<DiscoverMoviesApiResponse> getMoviesList(int genreId, int pageNumber) async {
    try {
      var response
       = await dio.get(
         'discover/movie',
         queryParameters: {
           "api_key": API_KEY,
           "language": "pt-BR",
           "sort_by": "popularity.desc",
           "include_adult": false,
           "include_video": false,
           "page": pageNumber,
           "with_genres": "$genreId"
         }
         );
        return DiscoverMoviesApiResponse.fromJson(response.data);  
    } catch (e) {
      throw ServerException();
    }
  }

}