import 'package:flutter/material.dart';

class GenreBox extends StatelessWidget {
  
  final String genreName;

  const GenreBox({Key key, this.genreName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xffE9ECEF))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 7),
          child: Text(genreName.toUpperCase(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff5E6770))),
        ),
      ),
    );
  }
}