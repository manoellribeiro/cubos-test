import 'dart:convert';

import 'package:cubos_test/app/core/errors/exceptions/cache_exception.dart';
import 'package:cubos_test/app/core/errors/exceptions/server_exception.dart';
import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/core/network/network_info.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/repositories/discover_movies_repository_implementation.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/show_movie_details/data/datasources/movie_details_local_datasource/movie_details_local_datasource.dart';
import 'package:cubos_test/app/features/show_movie_details/data/datasources/movie_details_remote_datasource/movie_details_remote_datasource.dart';
import 'package:cubos_test/app/features/show_movie_details/data/repositories/movie_details_repository_implementation.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MovieDetailsRemoteDataSourceMock extends Mock
    implements MovieDetailsRemoteDataSource {}

class MovieDetailsLocalDataSourceMock extends Mock
    implements MovieDetailsLocalDataSource {}

class NetworkInfoMock extends Mock implements NetworkInfo {}

void main() {
  MovieDetailsRepositoryImplementation repository;
  MovieDetailsRemoteDataSourceMock remoteDataSourceMock;
  MovieDetailsLocalDataSourceMock localDataSourceMock;
  NetworkInfoMock networkInfoMock;

  setUp(() {
    remoteDataSourceMock = MovieDetailsRemoteDataSourceMock();
    localDataSourceMock = MovieDetailsLocalDataSourceMock();
    networkInfoMock = NetworkInfoMock();
    repository = MovieDetailsRepositoryImplementation(
        remoteDataSource: remoteDataSourceMock,
        localDataSource: localDataSourceMock,
        networkInfo: networkInfoMock);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(networkInfoMock.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(networkInfoMock.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group("getMovieDetails", () {
    final int testMovieId = 123;

    final Map<String, dynamic> jsonMap =
        json.decode(fixture('movie_details.json'));

    final movieDetails = MovieDetails.fromJson(jsonMap);

    test(
      'should check connectivity',
      () async {
        // arrange
        when(networkInfoMock.isConnected).thenAnswer((_) async => true);
        // act
        repository.getMovieDetails(testMovieId);
        // assert
        verify(networkInfoMock.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'repository returns remote data when successfull',
        () async {
        
        when(remoteDataSourceMock.getMovieDetails(any)).thenAnswer((_) async => movieDetails);
        
        final result = await repository.getMovieDetails(testMovieId);

        verify(remoteDataSourceMock.getMovieDetails(testMovieId));
        expect(result, equals(Right(movieDetails)));

        });

        test(
        'repository cache data when successfull',
        () async {
        
        when(remoteDataSourceMock.getMovieDetails(any)).thenAnswer((_) async => movieDetails);
        
        await repository.getMovieDetails(testMovieId);

        verify(remoteDataSourceMock.getMovieDetails(testMovieId));
        verify(localDataSourceMock.storeMovieDetails(movieDetails));

        });

        test(
        'repository returns server failure when unsuccessful',
        () async {
        
        when(remoteDataSourceMock.getMovieDetails(any)).thenThrow(ServerException());
        
        final result = await repository.getMovieDetails(testMovieId);

        verify(remoteDataSourceMock.getMovieDetails(testMovieId));
        verifyZeroInteractions(localDataSourceMock);
        expect(result, isA<Left<Failure, dynamic>>());

        });
    });
  
    runTestsOffline(() {
      
      test(
        'repository returns last cached data',
        () async {
        
        when(localDataSourceMock.getMovieDetails(any)).thenAnswer((_) async => movieDetails);
        
        final result = await repository.getMovieDetails(testMovieId);

        verifyZeroInteractions(remoteDataSourceMock);
        verify(localDataSourceMock.getMovieDetails(testMovieId));
        expect(result, equals(Right(movieDetails)));

        });

        test(
        'repository returns cache failure when unsuccessful',
        () async {
        
        when(localDataSourceMock.getMovieDetails(any)).thenThrow(CacheException());
        
        final result = await repository.getMovieDetails(testMovieId);

        verify(localDataSourceMock.getMovieDetails(testMovieId));
        verifyZeroInteractions(remoteDataSourceMock);
        expect(result, isA<Left<Failure, dynamic>>());

        });
    });
  });
}
