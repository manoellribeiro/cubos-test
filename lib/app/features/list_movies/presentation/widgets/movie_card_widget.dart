import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/MovieResults.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  final MovieResults movieResult;

  const MovieCard({Key key, this.movieResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 80,
      width: SizeConfig.widthMultiplier * 100,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),      
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage('https://image.tmdb.org/t/p/w500/72I82eKXCadZWEYygV9GkJOQNEq.jpg'))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Mulan", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white)),
            SizedBox(height: 12),
            Row(
              children: [
                Text("Ação", style: Theme.of(context).textTheme.bodyText2,),
                Text("Aventura", style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
            SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}