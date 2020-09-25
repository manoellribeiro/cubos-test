import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class MoviePosterCard extends StatelessWidget {
  
  final String posterUrl;
  final int movieId;

  const MoviePosterCard({Key key, this.posterUrl, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: posterUrl,
      imageBuilder: (context, imageProvider) {
        return Hero(
          tag: movieId,
                  child: Container(
            width: SizeConfig.widthMultiplier * 60,
            height: SizeConfig.heightMultiplier * 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff00384C).withOpacity(0.2),
                  offset: Offset(0, 20),
                  blurRadius: 20,
                  spreadRadius: -10
                )
              ],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider)
            ),
          ),
        );
      },
    );
  }
}