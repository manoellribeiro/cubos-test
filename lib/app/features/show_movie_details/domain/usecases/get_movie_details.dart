import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/MovieDetails.dart';

abstract class GetMovieDetails {
  Future<Either<Failure, MovieDetails>> call(int movieId);
}
