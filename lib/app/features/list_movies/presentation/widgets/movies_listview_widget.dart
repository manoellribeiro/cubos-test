import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../domain/entities/MovieResults.dart';
import 'movie_card_widget.dart';

class MoviesListView extends StatelessWidget {
  final List<MovieResults> moviesResults;
  ScrollController scrollController;

  MoviesListView({Key key, this.moviesResults, this.scrollController}) : super(key: key);

  ListMoviesController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: moviesResults.length + 1,
        itemBuilder: (context, index) {
          bool isTheLastElement = (index == moviesResults.length);
          if (isTheLastElement) {
            if (controller.thereAreMoreMovies()) {
              return SpinKitThreeBounce(
                  size: SizeConfig.imageSizeMultiplier * 6,
                  color: Theme.of(context).accentColor);
            } else
              return Container();
          } else {
            MovieResults movieResult = moviesResults[index];
            return MovieCard(
              movieResult: movieResult,
            );
          }
        });
  }
}
