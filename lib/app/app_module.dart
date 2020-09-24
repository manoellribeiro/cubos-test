import 'package:cubos_test/app/core/network/network_info.dart';
import 'package:cubos_test/app/core/network/network_info_implementation.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource_implementation.dart';
import 'package:cubos_test/app/features/list_movies/data/repositories/discover_movies_repository_implementation.dart';
import 'package:cubos_test/app/features/list_movies/domain/repositories/discover_movies_repository.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/list_movies_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
      Bind((i) => ListMoviesController(getMoviesResults: Modular.get())),
      Bind((i) => GetMoviesResults(discoverMoviesRepository: Modular.get())),
      Bind((i) => DiscoverMoviesRepositoryImplementation(
        remoteDataSource: Modular.get(),
        localDataSource: Modular.get(),
        networkInfo: NetworkInfoImplementation()
        )),
      Bind((i) => DiscoverMoviesRemoteDataSourceImplementation(dio: Modular.get())),
      Bind((i) => BaseOptions(baseUrl: THE_MOVIE_DB_BASE_URL)),
      Bind((i) => Dio(Modular.get())),

    ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ListMoviesPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}