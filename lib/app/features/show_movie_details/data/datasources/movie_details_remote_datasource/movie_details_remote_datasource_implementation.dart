import 'package:cubos_test/app/features/show_movie_details/data/datasources/movie_details_remote_datasource/movie_details_remote_datasource.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details_implementation.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/exceptions/server_exception.dart';
import '../../../../../core/utils/constants.dart';

class MovieDetailsRemoteDataSourceImplementation implements MovieDetailsRemoteDataSource {
  
  final Dio dio;

  MovieDetailsRemoteDataSourceImplementation({
    this.dio});


  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      var response
       = await dio.get(
         'movie/$movieId',
         queryParameters: {
           "api_key": API_KEY,
           "language": "pt-BR",
           "append_to_response": 'credits'
         }
         );
        return MovieDetails.fromJson(response.data); 
    } catch (e) {
      throw ServerException();
    }
  }

}