import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/size_config.dart';
import '../../domain/entities/MovieResults.dart';
import '../views/controller/list_movies_controller.dart';

class ErrorMovieCard extends StatelessWidget {
  final MovieResults movieResult;

  ErrorMovieCard({Key key, this.movieResult}) : super(key: key);

  ListMoviesController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 30,
      width: SizeConfig.widthMultiplier * 100,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(movieResult.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white)),
            SizedBox(height: 12),
            Text(
              controller.createGenreString(movieResult.genreIds),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 32),
            Text("Erro ao baixar imagem",
                style: TextStyle(fontSize: 10, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
