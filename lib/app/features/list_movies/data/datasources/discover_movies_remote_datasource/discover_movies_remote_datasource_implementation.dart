import 'package:dio/dio.dart';

import '../../../../../core/errors/exceptions/server_exception.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/entities/DiscoverMoviesApiResponse.dart';
import 'discover_movies_remote_datasource.dart';
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