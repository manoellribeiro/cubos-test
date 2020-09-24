import 'package:cubos_test/app/core/errors/exceptions/cache_exception.dart';
import 'package:cubos_test/app/core/errors/exceptions/server_exception.dart';
import 'package:cubos_test/app/core/errors/failures/cache_failure.dart';
import 'package:cubos_test/app/core/errors/failures/server_failure.dart';
import 'package:cubos_test/app/core/network/network_info.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/core/errors/failures/failure.dart';
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
  Future<Either<Failure, DiscoverMoviesApiResponse>> getMoviesList(int genreId, int pageNumber) async {
    if(await networkInfo.isConnected){
      try {
        DiscoverMoviesApiResponse discoverMoviesApiResponse = await remoteDataSource.getMoviesList(genreId, pageNumber);
        return Right(discoverMoviesApiResponse);
      } on ServerException {
        return Left(ServerFailure(message: "Erro ao conectar com o servidor."));
      }
    } else {
      try {
        DiscoverMoviesApiResponse discoverMoviesApiResponse = await localDataSource.getMoviesList(genreId);
        //TODO: Check for the first call
        return Right(discoverMoviesApiResponse);
      } on CacheException {
        return Left(CacheFailure(message: "Error ao buscar dados locais."));
      }
    }
  }

}