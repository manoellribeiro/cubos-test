import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_test/app/core/functions/getGenreNameById.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/error_movie_card_widget.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/successful_movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/size_config.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/MovieResults.dart';

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
