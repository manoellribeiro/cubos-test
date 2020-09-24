import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class GenreTabBar extends StatelessWidget {
  
  bool isSelect;
  final String genreName;

  GenreTabBar({Key key, this.genreName, this.isSelect}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(color: isSelect ? Colors.transparent : Theme.of(context).backgroundColor),
        borderRadius: BorderRadius.circular(26),
        color: isSelect ? Theme.of(context).accentColor : Colors.white
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(genreName,
          style: Theme.of(context).textTheme.caption.copyWith(color: isSelect ? Colors.white : Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}