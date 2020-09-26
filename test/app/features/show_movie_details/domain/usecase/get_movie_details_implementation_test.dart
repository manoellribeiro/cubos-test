import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/repositories/movie_details_repository.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../json/movie_details.dart';

class MovieDetailsRepositoryMock extends Mock implements MovieDetailsRepository {}

void main() {
  
  GetMovieDetailsImplementation usecase;
  MovieDetailsRepositoryMock repository;

  setUp(() {
    repository = MovieDetailsRepositoryMock();
    usecase = GetMovieDetailsImplementation(movieDetailsRepository: repository);
  });

  final int testMovieId = 7;

  final movieDetails = MovieDetails.fromJson(MOVIE_DETAILS_JSON);
  
  test(
    'should get movie details for the movieId from the repository',
    () async {
      when(repository.getMovieDetails(any))
            .thenAnswer((_) async => Right(movieDetails));

      final result = await usecase.call(testMovieId);

      expect(result, Right(movieDetails));
      verify(repository.getMovieDetails(testMovieId));
      verifyNoMoreInteractions(repository);
    });
}