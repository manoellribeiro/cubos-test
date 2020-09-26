import 'dart:convert';

import 'package:cubos_test/app/core/errors/exceptions/cache_exception.dart';
import 'package:cubos_test/app/core/errors/exceptions/server_exception.dart';
import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/core/network/network_info.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/repositories/discover_movies_repository_implementation.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../json/discover_movies_api_response.dart';

class DiscoverMovieRemoteDataSourceMock extends Mock
    implements DiscoverMoviesRemoteDataSource {}

class DiscoverMovieLocalDataSourceMock extends Mock
    implements DiscoverMoviesLocalDataSource {}

class NetworkInfoMock extends Mock implements NetworkInfo {}

void main() {
  DiscoverMoviesRepositoryImplementation repository;
  DiscoverMovieRemoteDataSourceMock remoteDataSourceMock;
  DiscoverMovieLocalDataSourceMock localDataSourceMock;
  NetworkInfoMock networkInfoMock;

  setUp(() {
    remoteDataSourceMock = DiscoverMovieRemoteDataSourceMock();
    localDataSourceMock = DiscoverMovieLocalDataSourceMock();
    networkInfoMock = NetworkInfoMock();
    repository = DiscoverMoviesRepositoryImplementation(
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

  group("getMoviesList", () {
    final int testGenreId = 2;
    final int testPageNumber = 1;

    final discoverMoviesApiResponse =
        DiscoverMoviesApiResponse.fromJson(DISCOVER_MOVIES_API_RESPONSE_JSON);

    test(
      'should check connectivity',
      () async {
        // arrange
        when(networkInfoMock.isConnected).thenAnswer((_) async => true);
        // act
        repository.getMoviesList(testGenreId, testPageNumber);
        // assert
        verify(networkInfoMock.isConnected);
      },
    );

    runTestsOnline(() {
      test('repository returns remote data when successfull', () async {
        when(remoteDataSourceMock.getMoviesList(any, any))
            .thenAnswer((_) async => discoverMoviesApiResponse);

        final result =
            await repository.getMoviesList(testGenreId, testPageNumber);

        verify(remoteDataSourceMock.getMoviesList(testGenreId, testPageNumber));
        expect(result, equals(Right(discoverMoviesApiResponse)));
      });

      test('repository cache data when successfull', () async {
        when(remoteDataSourceMock.getMoviesList(any, any))
            .thenAnswer((_) async => discoverMoviesApiResponse);

        await repository.getMoviesList(testGenreId, testPageNumber);

        verify(remoteDataSourceMock.getMoviesList(testGenreId, testPageNumber));
        verify(localDataSourceMock.storeLastDiscoverMoviesApiResponse(
            discoverMoviesApiResponse, testGenreId));
      });

      test('repository returns server failure when unsuccessful', () async {
        when(remoteDataSourceMock.getMoviesList(any, any))
            .thenThrow(ServerException());

        final result =
            await repository.getMoviesList(testGenreId, testPageNumber);

        verify(remoteDataSourceMock.getMoviesList(testGenreId, testPageNumber));
        verifyZeroInteractions(localDataSourceMock);
        expect(result, isA<Left<Failure, dynamic>>());
      });
    });

    runTestsOffline(() {
      test('repository returns last cached data', () async {
        when(localDataSourceMock.getLastDiscoverMoviesApiResponse(any))
            .thenAnswer((_) async => discoverMoviesApiResponse);

        final result =
            await repository.getMoviesList(testGenreId, testPageNumber);

        verifyZeroInteractions(remoteDataSourceMock);
        verify(
            localDataSourceMock.getLastDiscoverMoviesApiResponse(testGenreId));
        expect(result, equals(Right(discoverMoviesApiResponse)));
      });

      test('repository returns cache failure when unsuccessful', () async {
        when(localDataSourceMock.getLastDiscoverMoviesApiResponse(any))
            .thenThrow(CacheException());

        final result =
            await repository.getMoviesList(testGenreId, testPageNumber);

        verify(
            localDataSourceMock.getLastDiscoverMoviesApiResponse(testGenreId));
        verifyZeroInteractions(remoteDataSourceMock);
        expect(result, isA<Left<Failure, dynamic>>());
      });
    });
  });
}
