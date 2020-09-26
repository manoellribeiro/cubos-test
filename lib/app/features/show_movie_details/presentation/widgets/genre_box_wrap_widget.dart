import 'package:flutter/material.dart';

import '../../domain/entities/Genre.dart';
import 'genre_box_widget.dart';

class GenreBoxWrap extends StatelessWidget {
  final List<Genre> genres;

  GenreBoxWrap({this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: genres
            .map((genre) => GenreBox(
                  genreName: genre.name,
                ))
            .toList());
  }
}
