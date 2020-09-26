import '../../../../core/configs/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/size_config.dart';
import '../../../../core/functions/formatMoneyValueToDollar.dart';
import '../../../../core/functions/formatMovieRuntime.dart';
import '../../../../core/functions/getYearFromReleaseDate.dart';
import '../widgets/genre_box_wrap_widget.dart';
import '../widgets/info_box_widget.dart';
import '../widgets/movie_details_widget.dart';
import '../widgets/movie_original_title_widget.dart';
import '../widgets/movie_poster_card_widget.dart';
import '../widgets/movie_score_widget.dart';
import '../widgets/movie_title_widget.dart';
import '../widgets/return_button_widget.dart';
import 'controller/movie_details_controller.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.widthMultiplier * 100,
          decoration: BoxDecoration(
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
              Observer(builder: (_) {
                if (controller.checkForState(MovieDetailsPageState.loading))
                  return CircularProgressIndicator();
                if (controller.checkForState(MovieDetailsPageState.failure))
                  return Text(
                    controller.failure.message,
                    style: TextStyle(color: Colors.black),
                  );
                if (controller.checkForState(MovieDetailsPageState.success)) {
                  return Flex(
                    direction: Axis.vertical,
                    children: [
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
                            infoName: Strings.year,
                            infoValue: getYearFromReleaseDate(
                                controller.movieDetails.releaseDate),
                          ),
                          InfoBox(
                            shouldExpand: false,
                            infoName: Strings.duration,
                            infoValue: formatMovieRuntime(
                                controller.movieDetails.runtime),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 2.5),
                      GenreBoxWrap(genres: controller.movieDetails.genres),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 8,
                      ),
                      MovieDetails(
                          detailType: Strings.description,
                          detailValue: controller.movieDetails.overview),
                      SizedBox(height: SizeConfig.heightMultiplier * 4),
                      InfoBox(
                          shouldExpand: true,
                          infoName: Strings.budget,
                          infoValue:
                              '\$ ${formatMoneyValueToDolar(controller.movieDetails.budget)}'),
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      InfoBox(
                          shouldExpand: true,
                          infoName: Strings.producers,
                          infoValue: controller.createProductionCompanyString(
                              controller.movieDetails.productionCompanies)),
                      SizedBox(height: SizeConfig.heightMultiplier * 5),
                      MovieDetails(
                        detailType: Strings.directors,
                        detailValue: controller.getDirectorsString(
                            controller.movieDetails.credits.crew),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 5),
                      MovieDetails(
                        detailType: Strings.cast,
                        detailValue: controller.getCastString(
                            controller.movieDetails.credits.cast),
                      ),
                    ],
                  );
                }
                return Container();
              }),
              SizedBox(height: SizeConfig.heightMultiplier * 5),
            ]),
          ),
        ),
      ),
    );
  }
}
