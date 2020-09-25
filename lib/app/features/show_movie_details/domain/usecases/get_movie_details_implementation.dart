import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import '../entities/MovieDetails.dart';
import '../repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsImplementation implements GetMovieDetails {

  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetailsImplementation({this.movieDetailsRepository});

  Future<Either<Failure, MovieDetails>> call (int movieId) async {
    return await movieDetailsRepository.getMovieDetails(movieId);
  }
}