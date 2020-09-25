import 'package:flutter/material.dart';

class MovieOriginalTitle extends StatelessWidget {
  
  final String originalTitle;

  const MovieOriginalTitle({Key key, this.originalTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Titulo original: ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xff5E6770))),
          TextSpan(text: originalTitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Color(0xff5E6770)))
        ]
      ),
    );
  }
}