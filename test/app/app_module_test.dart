import 'package:connectivity/connectivity.dart';
import 'package:cubos_test/app/app_module.dart';
import 'package:cubos_test/app/core/network/network_info.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_remote_datasource/discover_movies_remote_datasource.dart';
import 'package:cubos_test/app/features/list_movies/domain/repositories/discover_movies_repository.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results.dart';
import 'package:cubos_test/app/features/list_movies/domain/usecases/get_movies_results_implementation.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:cubos_test/app/features/show_movie_details/data/datasources/movie_details_local_datasource/movie_details_local_datasource.dart';
import 'package:cubos_test/app/features/show_movie_details/data/datasources/movie_details_remote_datasource/movie_details_remote_datasource.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/repositories/movie_details_repository.dart';
import 'package:cubos_test/app/features/show_movie_details/domain/usecases/get_movie_details.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/views/controller/movie_details_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  initModule(AppModule(), initialModule: true);

  //Core
  BaseOptions baseOptions;
  Dio dio;
  Connectivity connectivity;
  NetworkInfo networkInfo;

  //Feature - List Movies
  DiscoverMoviesLocalDataSource discoverMoviesLocalDataSource;
  DiscoverMoviesRemoteDataSource discoverMoviesRemoteDataSource;
  DiscoverMoviesRepository discoverMoviesRepository;
  GetMoviesResults getMoviesResults;
  ListMoviesController listMoviesController;

  //Feature - Show Movie Details
  MovieDetailsLocalDataSource movieDetailsLocalDataSource;
  MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepository movieDetailsRepository;
  GetMovieDetails getMovieDetails;
  MovieDetailsController movieDetailsController;

  setUp(() {
    //Core
    baseOptions = Modular.get();
    dio = Modular.get();
    connectivity = Modular.get();
    networkInfo = Modular.get();

    //Feature - List Movies
    discoverMoviesLocalDataSource = Modular.get();
    discoverMoviesRemoteDataSource = Modular.get();
    discoverMoviesRepository = Modular.get();
    getMoviesResults = Modular.get();
    listMoviesController = Modular.get();

    //Feature - Show Movie Details
    movieDetailsLocalDataSource = Modular.get();
    movieDetailsRemoteDataSource = Modular.get();
    movieDetailsRepository = Modular.get();
    getMovieDetails = Modular.get();
    movieDetailsController = Modular.get();

  });

  group("AppModule has core instances", (){
    test('has instance of BaseOptions', () {
      expect(baseOptions, isInstanceOf<BaseOptions>());
    });
    test('has instance of Dio', () {
      expect(dio, isInstanceOf<Dio>());
    });
    test('has instance of Connectivity', () {
      expect(connectivity, isInstanceOf<Connectivity>());
    });
    test('has instance of NetworkInfo', () {
      expect(networkInfo, isInstanceOf<NetworkInfo>());
    });
  });

  group("AppModule has List Movies Feature instances", () {
    test('has instance of DiscoverMoviesLocalDataSource', () {
      expect(discoverMoviesLocalDataSource, isInstanceOf<DiscoverMoviesLocalDataSource>());
    });
    test('has instance of DiscoverMoviesRemoteDataSource', () {
      expect(discoverMoviesRemoteDataSource, isInstanceOf<DiscoverMoviesRemoteDataSource>());
    });
    test('has instance of DiscoverMoviesRepository', () {
      expect(discoverMoviesRepository, isInstanceOf<DiscoverMoviesRepository>());
    });
    test('has instance of GetMoviesResults', () {
      expect(getMoviesResults, isInstanceOf<GetMoviesResults>());
    });
    test('has instance of ListMoviesController', () {
      expect(listMoviesController, isInstanceOf<ListMoviesController>());
    });
  });

  group("AppModule has Show Movie Details Feature instances", () {
    test('has instance of MovieDetailsLocalDataSource', () {
      expect(movieDetailsLocalDataSource, isInstanceOf<MovieDetailsLocalDataSource>());
    });
    test('has instance of MovieDetailsRemoteDataSource', () {
      expect(movieDetailsRemoteDataSource, isInstanceOf<MovieDetailsRemoteDataSource>());
    });
    test('has instance of MovieDetailsRepository', () {
      expect(movieDetailsRepository, isInstanceOf<MovieDetailsRepository>());
    });
    test('has instance of GetMovieDetails', () {
      expect(getMovieDetails, isInstanceOf<GetMovieDetails>());
    });
    test('has instance of MovieDetailsController', () {
      expect(movieDetailsController, isInstanceOf<MovieDetailsController>());
    });
  });

}