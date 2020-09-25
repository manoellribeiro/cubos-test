import 'package:cubos_test/app/core/functions/getGenreNameById.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
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
  ObservableList<MovieResults> moviesResultList;

  @observable
  DiscoverMoviesApiResponse lastDiscoverMoviesApiResponse;

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
          moviesResultList = successResult.results.asObservable();
          lastDiscoverMoviesApiResponse = successResult;
          });
  }

  bool checkForState(ListPageStates stateToCheck) =>  atualState == stateToCheck;

  @action
  bool thereAreMoreMovies() => lastDiscoverMoviesApiResponse.page < lastDiscoverMoviesApiResponse.totalPages;

  @action 
  Future fetchMoreMovies() async{
    if(thereAreMoreMovies()){
      final moviesResult = await getMoviesResults.call(ACTION_GENRE_ID, lastDiscoverMoviesApiResponse.page + 1);  
      moviesResult.fold(
        (errorResult){
          atualState = ListPageStates.failure;
          failure = errorResult;
          },
        (successResult){
          atualState = ListPageStates.success;
          moviesResultList.addAll(successResult.results);
          lastDiscoverMoviesApiResponse = successResult;
          });
    }
  }

  String createGenreString(List<int> genreIds){
    List<String> genresList = genreIds.map((genreId) => getGenreNameById(genreId)).toList();
    String genreString = genresList.join(' - '); 
    return genreString;
  }

}

enum ListPageStates {
  loading,
  success,
  failure
}