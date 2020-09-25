import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/size_config.dart';

class RoundedSearchTextField extends StatelessWidget {

  final String labelText;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final Function onChanged;

  const RoundedSearchTextField({Key key, this.labelText, this.prefixIcon, this.textInputType, this.obscureText, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: SizeConfig.heightMultiplier * 8,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(100)
            ),
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.grey,
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: SizeConfig.imageSizeMultiplier * 7,
                    ),
          focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none),
         
          disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red.withOpacity(0.3))),
          border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
          contentPadding: EdgeInsets.zero,
          alignLabelWithHint: true,
          hintText: labelText,
          hintStyle: Theme.of(context).textTheme.subtitle2),
      keyboardType: textInputType,
      obscureText: obscureText,
    )
                    )
                  ],
                ),
              ),
            );
  }
}