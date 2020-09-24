import '../../../../core/errors/failures/failure.dart';
import '../entities/MovieDetails.dart';
import 'package:dartz/dartz.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
}