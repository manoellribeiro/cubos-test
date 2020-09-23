import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/list_movies/domain/repositories/discover_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetMoviesResults {

  final DiscoverMoviesRepository discoverMoviesRepository;

  GetMoviesResults({this.discoverMoviesRepository});

  Future<Either<Failure, DiscoverMoviesApiResponse>> call (int genreId, int pageNumber) async {
    return await discoverMoviesRepository.getMoviesList(genreId, pageNumber);
  }
}