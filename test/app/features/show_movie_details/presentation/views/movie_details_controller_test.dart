import 'package:cubos_test/app/core/errors/failures/server_failure.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/Cast.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/ProductionCompany.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/views/controller/movie_details_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import '../../../../../fixtures/movie_details.dart';

class GetMovieDetailsMock extends Mock implements GetMovieDetails {}

void main() {
  GetMovieDetails getMovieDetailsMock;
  MovieDetailsController movieDetailsController;

  setUp(() {
    getMovieDetailsMock = GetMovieDetailsMock();
    movieDetailsController =
        MovieDetailsController(getMovieDetails: getMovieDetailsMock);
  });

  test('checkForState returns the correct value', () {
    movieDetailsController.atualState = MovieDetailsPageState.failure;
    expect(movieDetailsController.checkForState(MovieDetailsPageState.failure),
        true);
  });

  test('createProductionCompantString returns the correct value', () {
    List<ProductionCompany> productionCompanies = [
      ProductionCompany(name: "Company1"),
      ProductionCompany(name: "Company2"),
    ];

    expect(
        movieDetailsController
            .createProductionCompanyString(productionCompanies),
        "Company1, Company2");
  });

  test('getDirectorsString returns the correct value', () {
  
    final movieDetails = MovieDetails.fromJson(MOVIE_DETAILS_JSON);

    expect(movieDetailsController.getDirectorsString(movieDetails.credits.crew), "David Fincher");
  });

  test('getCastString returns the correct value', () {
    List<Cast> castList = [
      Cast(name: "Atriz"),
      Cast(name: "Ator"),
    ];

    expect(movieDetailsController.getCastString(castList), "Atriz, Ator");
  });

  group("getMovieDetailsAction returns with success value", () {

    final movieDetails = MovieDetails.fromJson(MOVIE_DETAILS_JSON);

    test(
      'set the value of movieDetails',
      () async {
        // arrange
        when(getMovieDetailsMock.call(any))
            .thenAnswer((_) async => Right(movieDetails));
        // act
        await movieDetailsController.getMovieDetailsAction(1);
        // assert
        expect(movieDetailsController.movieDetails, movieDetails);
      },
    );
    test(
      'set the value of atualState to success',
      () async {
        // arrange
        when(getMovieDetailsMock.call(any))
            .thenAnswer((_) async => Right(movieDetails));
        // act
        await movieDetailsController.getMovieDetailsAction(1);
        // assert
        expect(
            movieDetailsController.atualState, MovieDetailsPageState.success);
      },
    );
  });

  group("getMoviesResultList returns with failure value", () {
    test(
      'set the value of failure',
      () async {
        // arrange
        final failure = ServerFailure(message: "Any Failure");
        when(getMovieDetailsMock.call(any))
            .thenAnswer((_) async => Left(failure));
        // act
        await movieDetailsController.getMovieDetailsAction(1);
        // assert
        expect(movieDetailsController.failure, failure);
      },
    );

    test(
      'set the value of atualState to failure',
      () async {
        // arrange
        final failure = ServerFailure(message: "Any Failure");
        when(getMovieDetailsMock.call(any))
            .thenAnswer((_) async => Left(failure));
        // act
        await movieDetailsController.getMovieDetailsAction(1);
        // assert
        expect(
            movieDetailsController.atualState, MovieDetailsPageState.failure);
      },
    );
  });
}
