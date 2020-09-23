import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:dartz/dartz.dart';

abstract class DiscoverMoviesRepository {
  Future<Either<Failure, DiscoverMoviesApiResponse>> getMoviesList(int genreId, int pageNumber);
}