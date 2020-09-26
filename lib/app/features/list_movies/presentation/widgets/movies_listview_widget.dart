import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../domain/entities/MovieResults.dart';
import 'movie_card_widget.dart';

class MoviesListView extends StatelessWidget {
  ScrollController scrollController;

  MoviesListView({Key key, this.scrollController}) : super(key: key);

  ListMoviesController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){

      if(controller.moviesResultListFiltered.isEmpty){
        return Center(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Nenhum filme encontrado na listagem atual com esse nome", textAlign: TextAlign.center ,style: TextStyle(color: Colors.black),),
        ));
      }

      return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: controller.moviesResultListFiltered.length + 1,
        itemBuilder: (context, index) {
          bool isTheLastElement = (index == controller.moviesResultListFiltered.length);
          if (isTheLastElement) {
            if(!controller.isFiltering) {
              if (controller.thereAreMoreMovies()) {
              return SpinKitThreeBounce(
                  size: SizeConfig.imageSizeMultiplier * 6,
                  color: Theme.of(context).accentColor);
            } else
              return Container();
            } else {
              return Container();
            }
          } else {
            MovieResults movieResult = controller.moviesResultListFiltered[index];
            return MovieCard(
              movieResult: movieResult,
            );
          }
        });
    },);
  }
}
