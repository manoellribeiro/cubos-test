import 'package:cubos_test/app/core/errors/failures/server_failure.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../../json/discover_movies_api_response.dart';

class GetMoviesResultsMock extends Mock implements GetMoviesResults {}

void main() {
  GetMoviesResults mockGetMoviesResults;
  ListMoviesController listMoviesController;

  setUp(() {
    mockGetMoviesResults = GetMoviesResultsMock();
    listMoviesController =
        ListMoviesController(getMoviesResults: mockGetMoviesResults);
  });

  test('chooseGenreIdByTabBarIndex returns the correct value', () {
    expect(listMoviesController.chooseGenreIdByTabBarIndex(0), ACTION_GENRE_ID);
  });

  test('createGenreString returns the correct value', () {
    //arrange
    List<int> genreIds = [28, 12];
    //assert
    expect(listMoviesController.createGenreString(genreIds), "Ação - Aventura");
  });

  test('checkForState returns the correct value', () {
    listMoviesController.atualState = ListPageStates.failure;
    expect(listMoviesController.checkForState(ListPageStates.failure), true);
  });

  group(("TabBar related methods"), () {
    test(
      'selectedTabBarIndex should initializete as 0',
      () {
        expect(listMoviesController.selectedTabBarIndex, 0);
      },
    );
    test(
      'isSelect return the correct value',
      () {
        expect(listMoviesController.isSelect(0), true);
      },
    );
    test(
      'setSelectedTabBarIndex change the value of selectedTabBarIndex',
      () {
        listMoviesController.setSelectedTabBarIndex(2);
        expect(listMoviesController.selectedTabBarIndex, 2);
      },
    );
  });

  group("getMoviesResultList returns with success value", () {
    final discoverMoviesApiResponse =
        DiscoverMoviesApiResponse.fromJson(DISCOVER_MOVIES_API_RESPONSE_JSON);

    test(
      'set the value of moviesResultList',
      () async {
        // arrange
        when(mockGetMoviesResults.call(any, any))
            .thenAnswer((_) async => Right(discoverMoviesApiResponse));
        // act
        await listMoviesController.getMoviesResultList(28, 1);
        // assert
        expect(listMoviesController.moviesResultList,
            discoverMoviesApiResponse.results);
      },
    );

    test(
      'set the value of lastDiscoverMoviesApiResponse',
      () async {
        // arrange
        when(mockGetMoviesResults.call(any, any))
            .thenAnswer((_) async => Right(discoverMoviesApiResponse));
        // act
        await listMoviesController.getMoviesResultList(28, 1);
        // assert
        expect(listMoviesController.lastDiscoverMoviesApiResponse,
            discoverMoviesApiResponse);
      },
    );

    test(
      'set the value of atualState to success',
      () async {
        // arrange
        when(mockGetMoviesResults.call(any, any))
            .thenAnswer((_) async => Right(discoverMoviesApiResponse));
        // act
        await listMoviesController.getMoviesResultList(28, 1);
        // assert
        expect(listMoviesController.atualState, ListPageStates.success);
      },
    );
  });

  group("getMoviesResultList returns with failure value", () {
    test(
      'set the value of failure',
      () async {
        // arrange
        final failure = ServerFailure(message: "Any Failure");
        when(mockGetMoviesResults.call(any, any))
            .thenAnswer((_) async => Left(failure));
        // act
        await listMoviesController.getMoviesResultList(28, 1);
        // assert
        expect(listMoviesController.failure, failure);
      },
    );

    test(
      'set the value of atualState to failure',
      () async {
        // arrange
        final failure = ServerFailure(message: "Any Failure");
        when(mockGetMoviesResults.call(any, any))
            .thenAnswer((_) async => Left(failure));
        // act
        await listMoviesController.getMoviesResultList(28, 1);
        // assert
        expect(listMoviesController.atualState, ListPageStates.failure);
      },
    );
  });

  group("Filter list", () {
    final discoverMoviesApiResponse =
        DiscoverMoviesApiResponse.fromJson(DISCOVER_MOVIES_API_RESPONSE_JSON);

    test("movieTitleFilter should initiate as a empty string", () {
      expect(listMoviesController.movieTitleFilter, "");
    });
    test("setFilter change the value of movieTitleFilter", () {
      listMoviesController.setFilter("movie name");
      expect(listMoviesController.movieTitleFilter, "movie name");
    });
    test(
        "moviesResultListFiltered is equal to moviesResultList when movieTitleFilter is empty",
        () async {
      // arrange
      when(mockGetMoviesResults.call(any, any))
          .thenAnswer((_) async => Right(discoverMoviesApiResponse));
      // act
      await listMoviesController.getMoviesResultList(28, 1);
      //assert
      expect(listMoviesController.moviesResultList,
          listMoviesController.moviesResultListFiltered);
    });

    test(
        "moviesResultListFiltered contains moviesResultsList value when movieTitleFilter is not empty",
        () async {
      // arrange
      when(mockGetMoviesResults.call(any, any))
          .thenAnswer((_) async => Right(discoverMoviesApiResponse));
      // act
      await listMoviesController.getMoviesResultList(28, 1);
      listMoviesController.setFilter("M");
      //assert
      expect(listMoviesController.moviesResultList,
          contains(listMoviesController.moviesResultListFiltered.first));
    });
  });

  group("Pagination", () {
    final discoverMoviesApiResponse =
        DiscoverMoviesApiResponse.fromJson(DISCOVER_MOVIES_API_RESPONSE_JSON);

    test('isFiltering returns the correct value',() {
      listMoviesController.setFilter("sdasd");
      expect(listMoviesController.isFiltering, true);
    });

    test("thereAreMoreMovies returns the expected value", () async {
      // arrange
      when(mockGetMoviesResults.call(any, any))
          .thenAnswer((_) async => Right(discoverMoviesApiResponse));
      // act
      await listMoviesController.getMoviesResultList(28, 1);
      //assert
      expect(listMoviesController.thereAreMoreMovies(), true);
    });
    test("fetchMoreMovies add values to moviesResultList", () async {
      // arrange
      when(mockGetMoviesResults.call(any, any))
          .thenAnswer((_) async => Right(discoverMoviesApiResponse));
      // act
      await listMoviesController.getMoviesResultList(28, 1);
      final moviesResultsListLengthBeforeFetchMoreMovies =
          listMoviesController.moviesResultList.length;
      await listMoviesController.fetchMoreMovies();
      final moviesResultsListLengthAfterFetchMoreMovies =
          listMoviesController.moviesResultList.length;

      //assert
      expect(moviesResultsListLengthBeforeFetchMoreMovies,
          lessThan(moviesResultsListLengthAfterFetchMoreMovies));
    });
  });
}
