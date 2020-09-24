import 'package:cubos_test/app/features/show_movie_details/presentation/views/controller/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return Scaffold();
  }
}