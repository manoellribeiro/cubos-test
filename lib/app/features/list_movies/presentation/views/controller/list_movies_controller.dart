import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/MovieResults.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'list_movies_controller.g.dart';

class ListMoviesController = _ListMoviesControllerBase with _$ListMoviesController;

abstract class _ListMoviesControllerBase with Store {
  
  final GetMoviesResults getMoviesResults;

  _ListMoviesControllerBase({this.getMoviesResults});

  @observable
  List<MovieResults> moviesResultList;

  @observable
  Failure failure;

  @observable
  ListPageStates atualState;

  @action
  Future getMoviesResultList(genreId, pageNumber) async {
      atualState = ListPageStates.loading;
      final moviesResult = await getMoviesResults.call(genreId, pageNumber);  
      moviesResult.fold(
        (errorResult){
          atualState = ListPageStates.failure;
          failure = failure;
          },
        (successResult){
          atualState = ListPageStates.success;
          moviesResultList = successResult.results;
          });
  }

  bool checkForState(ListPageStates stateToCheck) =>  atualState == stateToCheck;
}

enum ListPageStates {
  loading,
  success,
  failure
}