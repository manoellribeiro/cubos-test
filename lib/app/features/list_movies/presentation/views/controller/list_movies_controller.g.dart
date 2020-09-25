// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMoviesController on _ListMoviesControllerBase, Store {
  Computed<List<MovieResults>> _$moviesResultListFilteredComputed;

  @override
  List<MovieResults> get moviesResultListFiltered =>
      (_$moviesResultListFilteredComputed ??= Computed<List<MovieResults>>(
              () => super.moviesResultListFiltered,
              name: '_ListMoviesControllerBase.moviesResultListFiltered'))
          .value;

  final _$moviesResultListAtom =
      Atom(name: '_ListMoviesControllerBase.moviesResultList');

  @override
  ObservableList<MovieResults> get moviesResultList {
    _$moviesResultListAtom.reportRead();
    return super.moviesResultList;
  }

  @override
  set moviesResultList(ObservableList<MovieResults> value) {
    _$moviesResultListAtom.reportWrite(value, super.moviesResultList, () {
      super.moviesResultList = value;
    });
  }

  final _$lastDiscoverMoviesApiResponseAtom =
      Atom(name: '_ListMoviesControllerBase.lastDiscoverMoviesApiResponse');

  @override
  DiscoverMoviesApiResponse get lastDiscoverMoviesApiResponse {
    _$lastDiscoverMoviesApiResponseAtom.reportRead();
    return super.lastDiscoverMoviesApiResponse;
  }

  @override
  set lastDiscoverMoviesApiResponse(DiscoverMoviesApiResponse value) {
    _$lastDiscoverMoviesApiResponseAtom
        .reportWrite(value, super.lastDiscoverMoviesApiResponse, () {
      super.lastDiscoverMoviesApiResponse = value;
    });
  }

  final _$failureAtom = Atom(name: '_ListMoviesControllerBase.failure');

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

  final _$atualStateAtom = Atom(name: '_ListMoviesControllerBase.atualState');

  @override
  ListPageStates get atualState {
    _$atualStateAtom.reportRead();
    return super.atualState;
  }

  @override
  set atualState(ListPageStates value) {
    _$atualStateAtom.reportWrite(value, super.atualState, () {
      super.atualState = value;
    });
  }

  final _$selectedTabBarIndexAtom =
      Atom(name: '_ListMoviesControllerBase.selectedTabBarIndex');

  @override
  int get selectedTabBarIndex {
    _$selectedTabBarIndexAtom.reportRead();
    return super.selectedTabBarIndex;
  }

  @override
  set selectedTabBarIndex(int value) {
    _$selectedTabBarIndexAtom.reportWrite(value, super.selectedTabBarIndex, () {
      super.selectedTabBarIndex = value;
    });
  }

  final _$movieTitleFilterAtom =
      Atom(name: '_ListMoviesControllerBase.movieTitleFilter');

  @override
  String get movieTitleFilter {
    _$movieTitleFilterAtom.reportRead();
    return super.movieTitleFilter;
  }

  @override
  set movieTitleFilter(String value) {
    _$movieTitleFilterAtom.reportWrite(value, super.movieTitleFilter, () {
      super.movieTitleFilter = value;
    });
  }

  final _$getMoviesResultListAsyncAction =
      AsyncAction('_ListMoviesControllerBase.getMoviesResultList');

  @override
  Future<dynamic> getMoviesResultList(dynamic genreId, dynamic pageNumber) {
    return _$getMoviesResultListAsyncAction
        .run(() => super.getMoviesResultList(genreId, pageNumber));
  }

  final _$fetchMoreMoviesAsyncAction =
      AsyncAction('_ListMoviesControllerBase.fetchMoreMovies');

  @override
  Future<dynamic> fetchMoreMovies() {
    return _$fetchMoreMoviesAsyncAction.run(() => super.fetchMoreMovies());
  }

  final _$_ListMoviesControllerBaseActionController =
      ActionController(name: '_ListMoviesControllerBase');

  @override
  void setSelectedTabBarIndex(int value) {
    final _$actionInfo = _$_ListMoviesControllerBaseActionController
        .startAction(name: '_ListMoviesControllerBase.setSelectedTabBarIndex');
    try {
      return super.setSelectedTabBarIndex(value);
    } finally {
      _$_ListMoviesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool thereAreMoreMovies() {
    final _$actionInfo = _$_ListMoviesControllerBaseActionController
        .startAction(name: '_ListMoviesControllerBase.thereAreMoreMovies');
    try {
      return super.thereAreMoreMovies();
    } finally {
      _$_ListMoviesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesResultList: ${moviesResultList},
lastDiscoverMoviesApiResponse: ${lastDiscoverMoviesApiResponse},
failure: ${failure},
atualState: ${atualState},
selectedTabBarIndex: ${selectedTabBarIndex},
movieTitleFilter: ${movieTitleFilter},
moviesResultListFiltered: ${moviesResultListFiltered}
    ''';
  }
}
