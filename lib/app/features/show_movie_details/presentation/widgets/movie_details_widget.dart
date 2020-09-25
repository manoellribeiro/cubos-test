import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  
  final String detailType;
  final String detailValue;

  const MovieDetails({Key key, this.detailType, this.detailValue}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(detailType, textAlign: TextAlign.left, style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w300),),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Text(detailValue, style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600, color: Color(0xff343A40)),),
        ],
      ),
    );
  }
}