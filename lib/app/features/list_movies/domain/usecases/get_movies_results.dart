import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/DiscoverMoviesApiResponse.dart';

abstract class GetMoviesResults {
  Future<Either<Failure, DiscoverMoviesApiResponse>> call(
      int genreId, int pageNumber);
}
