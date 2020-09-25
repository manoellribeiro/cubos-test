// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  final _$movieDetailsAtom =
      Atom(name: '_MovieDetailsControllerBase.movieDetails');

  @override
  MovieDetails get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetails value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  final _$failureAtom = Atom(name: '_MovieDetailsControllerBase.failure');

  @override
  Failure get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$atualStateAtom = Atom(name: '_MovieDetailsControllerBase.atualState');

  @override
  MovieDetailsPageState get atualState {
    _$atualStateAtom.reportRead();
    return super.atualState;
  }

  @override
  set atualState(MovieDetailsPageState value) {
    _$atualStateAtom.reportWrite(value, super.atualState, () {
      super.atualState = value;
    });
  }

  final _$getMovieDetailsActionAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.getMovieDetailsAction');

  @override
  Future<dynamic> getMovieDetailsAction(int movieId) {
    return _$getMovieDetailsActionAsyncAction
        .run(() => super.getMovieDetailsAction(movieId));
  }

  @override
  String toString() {
    return '''
movieDetails: ${movieDetails},
failure: ${failure},
atualState: ${atualState}
    ''';
  }
}
