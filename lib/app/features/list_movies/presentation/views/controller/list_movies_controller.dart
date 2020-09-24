import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/MovieResults.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'list_movies_controller.g.dart';

class ListMoviesController = _ListMoviesControllerBase with _$ListMoviesController;

abstract class _ListMoviesControllerBase with Store {
  
  final GetMoviesResults getMoviesResults;

  _ListMoviesControllerBase({this.getMoviesResults}){
    getMoviesResults(28, 1);
  }

  @observable
  Either<Failure,List<MovieResults>> moviesResultListOrFailure;

  @action
  Future getMoviesResultList(genreId, pageNumber) async {
      final moviesResult = await getMoviesResults.call(genreId, pageNumber);  
      moviesResult.fold(
        (l) => moviesResultListOrFailure = Left(l),
        (r) => moviesResultListOrFailure = Right(r.results));
  }

}