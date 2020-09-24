import 'package:mobx/mobx.dart';

import '../../../../../core/errors/failures/failure.dart';
import '../../../domain/entities/MovieResults.dart';
import '../../../domain/usecases/get_movies_results.dart';

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

  @observable
  int selectedTabBarIndex = 0;

  @action
  void setSelectedTabBarIndex(int value) => selectedTabBarIndex = value;

  bool isSelect(int tabBarIndex) => selectedTabBarIndex == tabBarIndex;

  @action
  Future getMoviesResultList(genreId, pageNumber) async {
      atualState = ListPageStates.loading;
      final moviesResult = await getMoviesResults.call(genreId, pageNumber);  
      moviesResult.fold(
        (errorResult){
          atualState = ListPageStates.failure;
          failure = errorResult;
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