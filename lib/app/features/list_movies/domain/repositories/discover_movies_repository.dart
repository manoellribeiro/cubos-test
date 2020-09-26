import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/DiscoverMoviesApiResponse.dart';

abstract class DiscoverMoviesRepository {
  Future<Either<Failure, DiscoverMoviesApiResponse>> getMoviesList(
      int genreId, int pageNumber);
}
