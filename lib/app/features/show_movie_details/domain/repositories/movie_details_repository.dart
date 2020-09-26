import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/MovieDetails.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
}
