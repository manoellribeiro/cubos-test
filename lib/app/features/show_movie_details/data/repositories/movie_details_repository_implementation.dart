import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../../../core/errors/exceptions/server_exception.dart';
import '../../../../core/errors/failures/cache_failure.dart';
import '../../../../core/errors/failures/failure.dart';
import '../../../../core/errors/failures/server_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/MovieDetails.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../datasources/movie_details_local_datasource/movie_details_local_datasource.dart';
import '../datasources/movie_details_remote_datasource/movie_details_remote_datasource.dart';

class MovieDetailsRepositoryImplementation implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDataSource;
  final MovieDetailsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MovieDetailsRepositoryImplementation(
      {this.remoteDataSource, this.localDataSource, this.networkInfo});

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    if (await networkInfo.isConnected) {
      try {
        MovieDetails movieDetails =
            await remoteDataSource.getMovieDetails(movieId);
        await localDataSource.storeMovieDetails(movieDetails);
        return Right(movieDetails);
      } on ServerException {
        return Left(ServerFailure(message: "Erro ao conectar com o servidor."));
      }
    } else {
      try {
        MovieDetails movieDetails =
            await localDataSource.getMovieDetails(movieId);
        return Right(movieDetails);
      } on CacheException {
        return Left(CacheFailure(message: "Erro ao buscar dados locais."));
      }
    }
  }
}
