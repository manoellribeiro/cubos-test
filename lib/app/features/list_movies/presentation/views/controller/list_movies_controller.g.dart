// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMoviesController on _ListMoviesControllerBase, Store {
  final _$moviesResultListOrFailureAtom =
      Atom(name: '_ListMoviesControllerBase.moviesResultListOrFailure');

  @override
  Either<Failure, List<MovieResults>> get moviesResultListOrFailure {
    _$moviesResultListOrFailureAtom.reportRead();
    return super.moviesResultListOrFailure;
  }

  @override
  set moviesResultListOrFailure(Either<Failure, List<MovieResults>> value) {
    _$moviesResultListOrFailureAtom
        .reportWrite(value, super.moviesResultListOrFailure, () {
      super.moviesResultListOrFailure = value;
    });
  }

  final _$getMoviesResultListAsyncAction =
      AsyncAction('_ListMoviesControllerBase.getMoviesResultList');

  @override
  Future<dynamic> getMoviesResultList(dynamic genreId, dynamic pageNumber) {
    return _$getMoviesResultListAsyncAction
        .run(() => super.getMoviesResultList(genreId, pageNumber));
  }

  @override
  String toString() {
    return '''
moviesResultListOrFailure: ${moviesResultListOrFailure}
    ''';
  }
}
