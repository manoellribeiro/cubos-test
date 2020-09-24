import 'package:cubos_test/app/features/list_movies/domain/entities/MovieResults.dart';
import 'package:flutter/material.dart';

import 'movie_card_widget.dart';

class MoviesListView extends StatelessWidget {
  
  final List<MovieResults> moviesResults;

  const MoviesListView({Key key, this.moviesResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        // MovieResults movieResult = moviesResults[index];
        return MovieCard();
      });
  }
}