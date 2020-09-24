import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../entities/DiscoverMoviesApiResponse.dart';
import '../repositories/discover_movies_repository.dart';

class GetMoviesResults {

  final DiscoverMoviesRepository discoverMoviesRepository;

  GetMoviesResults({this.discoverMoviesRepository});

  Future<Either<Failure, DiscoverMoviesApiResponse>> call (int genreId, int pageNumber) async {
    return await discoverMoviesRepository.getMoviesList(genreId, pageNumber);
  }
}