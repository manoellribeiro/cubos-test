import 'package:cubos_test/app/features/show_movie_details/domain/entities/Genre.dart';
import 'package:cubos_test/app/features/show_movie_details/presentation/widgets/genre_box_widget.dart';

import 'package:flutter/material.dart';

class GenreBoxWrap extends StatelessWidget {
  
  final List<Genre> genres;

  GenreBoxWrap({this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: 
      genres.map((genre) => GenreBox(genreName: genre.name,)).toList()
    );
  }
}