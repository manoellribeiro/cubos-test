import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/rounded_search_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListMoviesPage extends StatefulWidget {
  @override
  _ListMoviesPageState createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              height: SizeConfig.heightMultiplier * 28,
              width: SizeConfig.widthMultiplier * 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.heightMultiplier * 7,),
                    Text(
                      "Filmes",
                      style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 3,),
                      RoundedSearchTextField(
                      labelText: "Pesquise filmes",
                      prefixIcon: Icons.search,
                      textInputType: TextInputType.text,
                      obscureText: false,
                    ),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}