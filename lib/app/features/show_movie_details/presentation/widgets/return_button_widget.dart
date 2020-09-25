import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReturnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () => Modular.to.pop(),
          child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: SizeConfig.imageSizeMultiplier * 3,
                color: Color(0xff5E6770),
                ),
              SizedBox(width: SizeConfig.widthMultiplier * 2.5),  
              Text("Voltar", style: Theme.of(context).textTheme.button,)
            ],
          ),
        ),
      ),
    );
  }
}