import 'package:cubos_test/app/core/errors/failures/failure.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/MovieDetails.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/entities/ProductionCompany.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details.dart';
import 'package:mobx/mobx.dart';
part 'movie_details_controller.g.dart';

class MovieDetailsController = _MovieDetailsControllerBase with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store { 
  
  final GetMovieDetails getMovieDetails;

  _MovieDetailsControllerBase({
    this.getMovieDetails});

  @observable
  MovieDetails movieDetails;

  @observable
  Failure failure;

  @observable
  MovieDetailsPageState atualState;

  @action 
  Future getMovieDetailsAction(int movieId) async {
    atualState = MovieDetailsPageState.loading;
    final movieDetailsResult = await getMovieDetails.call(movieId);
    movieDetailsResult.fold(
      (errorResult){
        atualState = MovieDetailsPageState.failure;
        failure = errorResult;
        },
      (successResult){
        atualState = MovieDetailsPageState.success;
        movieDetails = successResult;
        });
  }

  String createProductionCompanyString(List<ProductionCompany> productionCompanies){
    List<String> productionCompaniesNames = productionCompanies.map((productionCompany) => productionCompany.name).toList();
    String productionString = productionCompaniesNames.join(', ');
    return productionString;
  }

}

enum MovieDetailsPageState {
  loading,
  success,
  failure
}