import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/genre_tab_bar_widget.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/movies_listview_widget.dart';
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
              height: SizeConfig.heightMultiplier * 100,
              width: SizeConfig.widthMultiplier * 100,
              child: Column(
                children: [
                  Container(
                  color: Colors.white,
                  height: SizeConfig.heightMultiplier * 27,
                  width: SizeConfig.widthMultiplier * 100,
                ),
                Expanded(
                  flex: 1,
                      child: MoviesListView(),
                )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white.withOpacity(0.5)]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
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
                    SizedBox(height: SizeConfig.widthMultiplier * 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenreTabBar(
                          isSelect: true,
                          genreName: "Ação",
                        ),
                        GenreTabBar(
                          isSelect: true,
                          genreName: "Aventura",
                        ),
                        GenreTabBar(
                          isSelect: true,
                          genreName: "Fantasia",
                        ),
                        GenreTabBar(
                          isSelect: true,
                          genreName: "Comédia",
                        ),
                      ],),
                      SizedBox(height: SizeConfig.heightMultiplier * 5)
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}