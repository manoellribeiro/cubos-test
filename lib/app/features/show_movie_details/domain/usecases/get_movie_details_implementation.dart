import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/MovieDetails.dart';
import '../repositories/movie_details_repository.dart';
import 'get_movie_details.dart';

class GetMovieDetailsImplementation implements GetMovieDetails {
  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsImplementation({this.movieDetailsRepository});

  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await movieDetailsRepository.getMovieDetails(movieId);
  }
}
