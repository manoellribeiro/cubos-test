import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  
  final String infoName;
  final String infoValue;

  InfoBox({this.infoName, this.infoValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 8),
        child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '$infoName: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff868E96))),
            TextSpan(text: infoValue, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xff343A40)))
          ]
        ),
    ),
      )
    );
  }
}