import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/MovieResults.dart';
import '../views/controller/list_movies_controller.dart';
import 'error_movie_card_widget.dart';
import 'successful_movie_card_widget.dart';

class MovieCard extends StatelessWidget {
  final MovieResults movieResult;

  MovieCard({Key key, this.movieResult}) : super(key: key);

  ListMoviesController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: '$THE_MOVIE_DB_IMAGE_BASE_URL${movieResult.posterPath}',
        errorWidget: (context, url, error) => ErrorMovieCard(
              movieResult: movieResult,
            ),
        imageBuilder: (context, imageProvider) => SuccessfulMovieCard(
              movieResult: movieResult,
              imageProvider: imageProvider,
            ));
  }
}
