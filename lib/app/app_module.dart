import 'package:connectivity/connectivity.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/views/movie_details_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'core/network/network_info_implementation.dart';
import 'core/utils/constants.dart';
import 'features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource_implementation.dart';
import 'features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource_implementation.dart';
import 'features/list_movies/data/repositories/discover_movies_repository_implementation.dart';
import 'features/list_movies/domain/usecases/get_movies_results_implementation.dart';
import 'features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'features/list_movies/presentation/views/list_movies_page.dart';
import 'features/show_movie_details/data/datasources/movie_details_local_datasource/movie_details_local_datasource_implementation.dart';
import 'features/show_movie_details/data/datasources/movie_details_remote_datasource/movie_details_remote_datasource_implementation.dart';
import 'features/show_movie_details/data/repositories/movie_details_repository_implementation.dart';
import 'features/show_movie_details/domain/usecases/get_movie_details_implementation.dart';
import 'features/show_movie_details/presentation/views/controller/movie_details_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
      //Core
      Bind((i) => BaseOptions(baseUrl: THE_MOVIE_DB_BASE_URL)),
      Bind((i) => Dio(Modular.get())),
      Bind((i) => Connectivity()),
      Bind((i) => NetworkInfoImplementation(connectivity: Modular.get())),

      //Feature - List Movies
      Bind((i) => DiscoverMoviesRemoteDataSourceImplementation(dio: Modular.get())),
      Bind((i) => DiscoverMoviesLocalDataSourceImplementation()),
      Bind((i) => DiscoverMoviesRepositoryImplementation(
        remoteDataSource: Modular.get(),
        localDataSource: Modular.get(),
        networkInfo: Modular.get()
        )),
      Bind((i) => GetMoviesResultsImplementation(discoverMoviesRepository: Modular.get())),
      Bind((i) => ListMoviesController(getMoviesResults: Modular.get())),
      

      //Feature - Show Movie Details
      Bind((i) => MovieDetailsRemoteDataSourceImplementation(dio: Modular.get())),
      Bind((i) => MovieDetailsLocalDataSourceImplementation()),
      Bind((i) => MovieDetailsRepositoryImplementation(
        remoteDataSource: Modular.get(),
        localDataSource: Modular.get(),
        networkInfo: Modular.get()
        )),
      Bind((i) => GetMovieDetailsImplementation(movieDetailsRepository: Modular.get())),
      Bind((i) => MovieDetailsController(getMovieDetails: Modular.get())),

    ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ListMoviesPage()),
        ModularRouter('/showDetails', transition: TransitionType.fadeIn, child: (_, args) => MovieDetailsPage(arguments: args.data)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}