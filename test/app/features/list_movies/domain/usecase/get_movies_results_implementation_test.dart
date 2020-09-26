import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/list_movies/domain/repositories/discover_movies_repository.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../json/discover_movies_api_response.dart';
import '../../data/repositories/discover_movies_repository_implementation_test.dart';

class DiscoverMoviesRepositoryMock extends Mock
    implements DiscoverMoviesRepository {}

void main() {
  GetMoviesResultsImplementation usecase;
  DiscoverMoviesRepositoryMock repository;

  setUp(() {
    repository = DiscoverMoviesRepositoryMock();
    usecase =
        GetMoviesResultsImplementation(discoverMoviesRepository: repository);
  });

  final int testGenreId = 12;
  final int testPageNumber = 1;

  final discoverMoviesApiResponse =
      DiscoverMoviesApiResponse.fromJson(DISCOVER_MOVIES_API_RESPONSE_JSON);

  test(
      'should get movies results for the genreId and pageNumber from the repository',
      () async {
    when(repository.getMoviesList(any, any))
        .thenAnswer((_) async => Right(discoverMoviesApiResponse));

    final result = await usecase.call(testGenreId, testPageNumber);

    expect(result, Right(discoverMoviesApiResponse));
    verify(repository.getMoviesList(testGenreId, testPageNumber));
    verifyNoMoreInteractions(repository);
  });
}
