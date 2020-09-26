import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../../../core/errors/exceptions/server_exception.dart';
import '../../../../core/errors/failures/cache_failure.dart';
import '../../../../core/errors/failures/failure.dart';
import '../../../../core/errors/failures/server_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/DiscoverMoviesApiResponse.dart';
import '../../domain/repositories/discover_movies_repository.dart';
import '../datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import '../datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';

class DiscoverMoviesRepositoryImplementation
    implements DiscoverMoviesRepository {
  final DiscoverMoviesRemoteDataSource remoteDataSource;
  final DiscoverMoviesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DiscoverMoviesRepositoryImplementation(
      {this.remoteDataSource, this.localDataSource, this.networkInfo});

  @override
  Future<Either<Failure, DiscoverMoviesApiResponse>> getMoviesList(
      int genreId, int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        DiscoverMoviesApiResponse discoverMoviesApiResponse =
            await remoteDataSource.getMoviesList(genreId, pageNumber);
        await localDataSource.storeLastDiscoverMoviesApiResponse(
            discoverMoviesApiResponse, genreId);
        return Right(discoverMoviesApiResponse);
      } on ServerException {
        return Left(ServerFailure(message: "Erro ao conectar com o servidor."));
      }
    } else {
      try {
        DiscoverMoviesApiResponse discoverMoviesApiResponse =
            await localDataSource.getLastDiscoverMoviesApiResponse(genreId);
        return Right(discoverMoviesApiResponse);
      } on CacheException {
        return Left(CacheFailure(message: "Erro ao buscar dados locais."));
      }
    }
  }
}
