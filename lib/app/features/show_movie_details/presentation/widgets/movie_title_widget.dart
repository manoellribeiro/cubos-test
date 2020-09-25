import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  
  final String title;

  const MovieTitle({Key key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
      );
  }
}