import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:dartz/dartz.dart';

abstract class GetMovieDetails {
  Future<Either<Failure, MovieDetails>> call (int movieId); 
}