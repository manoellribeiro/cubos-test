import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/DiscoverMoviesApiResponse.dart';
import 'discover_movies_local_datasource.dart';

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