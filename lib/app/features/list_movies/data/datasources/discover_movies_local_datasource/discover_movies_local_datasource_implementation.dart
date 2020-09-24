import 'dart:async';

import 'package:cubos_test/app/features/list_movies/data/datasources/discover_movies_local_datasource/discover_movies_local_datasource.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/DiscoverMoviesApiResponse.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DiscoverMoviesLocalDataSourceImplementation implements DiscoverMoviesLocalDataSource {
  
  Completer<Box> completer = Completer<Box>();

  _initHive() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('discoverMovies');
    completer.complete(box);
  }

  @override
  Future<DiscoverMoviesApiResponse> getLastDiscoverMoviesApiResponse(int genreId) async {
    if(!completer.isCompleted){
      await _initHive();
    }
    Box box = await completer.future;
    return DiscoverMoviesApiResponse.fromJson(box.get(genreId, defaultValue: "There's no data stored"));
  }
  
  @override
  Future storeLastDiscoverMoviesApiResponse(DiscoverMoviesApiResponse lastDiscoverMoviesApiResponse, int genreId) async {
    if(!completer.isCompleted){
      await _initHive();
    }
    Box box = await completer.future;
    box.put(genreId, lastDiscoverMoviesApiResponse.toJson());
  }
}