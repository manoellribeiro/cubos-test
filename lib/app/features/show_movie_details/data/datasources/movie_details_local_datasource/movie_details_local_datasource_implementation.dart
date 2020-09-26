import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/errors/exceptions/cache_exception.dart';
import '../../../domain/entities/MovieDetails.dart';
import 'movie_details_local_datasource.dart';

class MovieDetailsLocalDataSourceImplementation
    implements MovieDetailsLocalDataSource {
  Completer<Box> completer = Completer<Box>();

  _initHive() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('movieDetails');
    completer.complete(box);
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    if (!completer.isCompleted) {
      await _initHive();
    }
    try {
      Box box = await completer.future;
      return MovieDetails.fromJson(
          box.get(movieId, defaultValue: "There's no data stored"));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> storeMovieDetails(MovieDetails movieDetails) async {
    if (!completer.isCompleted) {
      await _initHive();
    }
    Box box = await completer.future;
    box.put(movieDetails.id, movieDetails.toJson());
  }
}
