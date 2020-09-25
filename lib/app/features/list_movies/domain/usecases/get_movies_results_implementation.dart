import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/DiscoverMoviesApiResponse.dart';
import '../repositories/discover_movies_repository.dart';

class GetMoviesResultsImplementation implements GetMoviesResults {

  final DiscoverMoviesRepository discoverMoviesRepository;

  GetMoviesResultsImplementation({this.discoverMoviesRepository});

  Future<Either<Failure, DiscoverMoviesApiResponse>> call (int genreId, int pageNumber) async {
    return await discoverMoviesRepository.getMoviesList(genreId, pageNumber);
  }
}