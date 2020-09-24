import '../../../../core/errors/failures/failure.dart';
import '../../../list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import '../entities/MovieDetails.dart';
import '../repositories/movie_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetails {

  final MovieDetailsRepository movieDetailsRepository;

  GetMovieDetails({this.movieDetailsRepository});

  Future<Either<Failure, MovieDetails>> call (int movieId) async {
    return await movieDetailsRepository.getMovieDetails(movieId);
  }
}