import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetails {

  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetails({this.movieDetailsRepository});

  Future<Either<Failure, MovieDetails>> call (int movieId) async {
    return await movieDetailsRepository.getMovieDetails(movieId);
  }
}