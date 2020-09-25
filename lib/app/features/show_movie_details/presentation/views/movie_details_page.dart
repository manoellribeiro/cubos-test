import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/core/functions/formatMovieRuntime.dart';
import 'package:cubos_test/app/core/functions/getYearFromReleaseDate.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/views/controller/movie_details_controller.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/genre_box_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/genre_box_wrap.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/info_box_widget.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/movie_original_title_widget.dart';
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

class _MovieDetailsPageState extends ModularState<MovieDetailsPage, MovieDetailsController> {
  
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
          gradient: LinearGradient(
            colors: [
              Theme.of(context).backgroundColor,
               Theme.of(context).backgroundColor,
               Theme.of(context).scaffoldBackgroundColor,
               Theme.of(context).scaffoldBackgroundColor],
            stops: [0.0, 0.4, 0.4, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 7),
            Align(
              alignment: Alignment.centerLeft,
              child: ReturnButton()),
            SizedBox(height: SizeConfig.heightMultiplier * 8,),
            MoviePosterCard(
              movieId: widget.arguments['movieId'],
              posterUrl: widget.arguments['moviePosterUrl'],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 5,),
            MovieScore(
              score: controller.movieDetails.voteAverage
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 6,),
            MovieTitle(title: controller.movieDetails.title,),
            SizedBox(height: SizeConfig.heightMultiplier * 3,),
            MovieOriginalTitle(originalTitle: controller.movieDetails.originalTitle),
            SizedBox(height: SizeConfig.heightMultiplier * 3,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoBox(
                    infoName: "Ano",
                    infoValue: getYearFromReleaseDate(controller.movieDetails.releaseDate),
                  ),
                  InfoBox(
                    infoName: "Duração",
                    infoValue: formatMovieRuntime(controller.movieDetails.runtime),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
              child: GenreBoxWrap(genres: controller.movieDetails.genres),
            )
          ]
        ),
      ),
    );
  }
}