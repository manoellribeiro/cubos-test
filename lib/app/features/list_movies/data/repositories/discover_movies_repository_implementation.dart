import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/core/errors/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/repositories/discover_movies_repository.dart';
import 'package:dartz/dartz.dart';

class DiscoverMoviesRepositoryImplementation implements DiscoverMoviesRepository {
  
  final DiscoverMoviesRemoteDataSource remoteDataSource;
  final DiscoverMoviesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DiscoverMoviesRepositoryImplementation(
    {
      this.remoteDataSource,
      this.localDataSource,
      this.networkInfo
    });

  @override
  Future<Either<Failure, DiscoverMoviesApiResponse>> getMoviesList(int genreId, int pageNumber) {
    // TODO: implement getMoviesList
    throw UnimplementedError();
  }

}