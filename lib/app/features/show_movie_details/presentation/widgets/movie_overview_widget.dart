import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {
  
  final String overview;

  const MovieOverview({Key key, this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Descrição", textAlign: TextAlign.left, style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w300),),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        Text(overview, textAlign: TextAlign.justify, style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600, color: Color(0xff343A40)),),
      ],
    );
  }
}