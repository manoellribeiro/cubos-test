import 'package:flutter/material.dart';

class MovieScore extends StatelessWidget {
  
  final double score;

  const MovieScore({Key key, this.score}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$score', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Theme.of(context).accentColor)),
          TextSpan(text: ' /10', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xff868E96)))
        ]
      ),
    );
  }
}