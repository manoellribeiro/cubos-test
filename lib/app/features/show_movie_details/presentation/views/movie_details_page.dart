import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/core/functions/formatMoneyValueToDollar.dart';
import 'package:cubos_test/app/core/functions/formatMovieRuntime.dart';
import 'package:cubos_test/app/core/functions/getYearFromReleaseDate.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/views/controller/movie_details_controller.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/genre_box_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/genre_box_wrap_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/info_box_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_original_title_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_details_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_poster_card_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_score_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_title_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/return_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class MovieDetailsPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const MovieDetailsPage({Key key, this.arguments}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, MovieDetailsController> {
  @override
  void initState() {
    controller.getMovieDetailsAction(widget.arguments['movieId']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
            color: Colors.red,
            gradient: LinearGradient(colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).backgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor
            ], stops: [
              0.0,
              0.22,
              0.22,
              1
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(height: SizeConfig.heightMultiplier * 7),
            Align(alignment: Alignment.centerLeft, child: ReturnButton()),
            SizedBox(
              height: SizeConfig.heightMultiplier * 8,
            ),
            MoviePosterCard(
              movieId: widget.arguments['movieId'],
              posterUrl: widget.arguments['moviePosterUrl'],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            MovieScore(score: controller.movieDetails.voteAverage),
            SizedBox(
              height: SizeConfig.heightMultiplier * 6,
            ),
            MovieTitle(
              title: controller.movieDetails.title,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            MovieOriginalTitle(
                originalTitle: controller.movieDetails.originalTitle),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Wrap(
              spacing: 12,
              children: [
                InfoBox(
                  shouldExpand: false,
                  infoName: "Ano",
                  infoValue: getYearFromReleaseDate(
                      controller.movieDetails.releaseDate),
                ),
                InfoBox(
                  shouldExpand: false,
                  infoName: "Duração",
                  infoValue:
                      formatMovieRuntime(controller.movieDetails.runtime),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            GenreBoxWrap(genres: controller.movieDetails.genres),
            SizedBox(
              height: SizeConfig.heightMultiplier * 8,
            ),
            MovieDetails(
                detailType: "Descrição",
                detailValue: controller.movieDetails.overview),
            SizedBox(height: SizeConfig.heightMultiplier * 4),
            InfoBox(
                shouldExpand: true,
                infoName: "ORÇAMENTO",
                infoValue:
                    '\$ ${formatMoneyValueToDolar(controller.movieDetails.budget)}'),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            InfoBox(
                shouldExpand: true,
                infoName: "PRODUTORAS",
                infoValue: controller.createProductionCompanyString(
                    controller.movieDetails.productionCompanies)),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
            MovieDetails(
              detailType: "Diretor",
              detailValue: controller
                  .getDirectorsString(controller.movieDetails.credits.crew),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
            MovieDetails(
              detailType: "Elenco",
              detailValue: controller
                  .getCastString(controller.movieDetails.credits.cast),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
          ]),
        ),
      ),
    );
  }
}
