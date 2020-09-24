import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/domain/entities/MovieResults.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  final MovieResults movieResult;

  const MovieCard({Key key, this.movieResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$THE_MOVIE_DB_IMAGE_BASE_URL${movieResult.posterPath}',
      errorWidget: (context, url , error) => Container(
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
            Text(movieResult.title, style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white)),
            SizedBox(height: 12),
            Row(
              children: [
                Text("Ação", style: Theme.of(context).textTheme.bodyText2,),
                Text("Aventura", style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
            SizedBox(height: 32),
            Text("Erro ao baixar imagem", style: TextStyle(fontSize: 10, color: Colors.red)),
          ],
        ),
      ),
    ),
      imageBuilder: (context, imageProvider) => Container(
      height: SizeConfig.heightMultiplier * 80,
      width: SizeConfig.widthMultiplier * 100,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: imageProvider)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(movieResult.title, style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white)),
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
    ),
    );
  }
}


