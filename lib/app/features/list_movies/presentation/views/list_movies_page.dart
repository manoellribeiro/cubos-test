import 'package:cubos_test/app/core/configs/size_config.dart';
import 'package:cubos_test/app/core/utils/constants.dart';
import 'package:cubos_test/app/features/list_movies/presentation/views/controller/list_movies_controller.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/genre_tab_bar_widget.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/movies_listview_widget.dart';
import 'package:cubos_test/app/features/list_movies/presentation/widgets/rounded_search_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListMoviesPage extends StatefulWidget {
  @override
  _ListMoviesPageState createState() => _ListMoviesPageState();
}

class _ListMoviesPageState
    extends ModularState<ListMoviesPage, ListMoviesController> {
  @override
  void initState() {
    controller
        .getMoviesResultList(28, 1)
        .then((value) => print(controller.moviesResultList));
    super.initState();
  }

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
                    child: Observer(builder: (_) {
                      if (controller.checkForState(ListPageStates.loading))
                        return Center(child: CircularProgressIndicator());
                      if (controller.checkForState(ListPageStates.success))
                        return MoviesListView(
                          moviesResults: controller.moviesResultList,
                        );
                      if (controller.checkForState(ListPageStates.failure))
                        return Center(child: Text("Failure"));
                      return Container();
                    }),
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
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 20),
                          blurRadius: 30)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white.withOpacity(0.1)]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: SizeConfig.widthMultiplier * 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 7,
                      ),
                      Text(
                        "Filmes",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      RoundedSearchTextField(
                        labelText: "Pesquise filmes",
                        prefixIcon: Icons.search,
                        textInputType: TextInputType.text,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: SizeConfig.widthMultiplier * 5,
                      ),
                      Observer(builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GenreTabBar(
                              onTap: () {
                                controller.setSelectedTabBarIndex(0);
                                controller.getMoviesResultList(ACTION_GENRE_ID, 1);
                                },
                              isSelect: controller.isSelect(0),
                              genreName: "Ação",
                            ),
                            GenreTabBar(
                                onTap: (){
                                  controller.setSelectedTabBarIndex(1);
                                  controller.getMoviesResultList(ADVENTURE_GENRE_ID, 1);
                                  },
                                isSelect: controller.isSelect(1),
                                genreName: "Aventura",
                              ),
                            GenreTabBar(
                              onTap: (){
                                controller.setSelectedTabBarIndex(2);
                                controller.getMoviesResultList(FANTASY_GENRE_ID, 1);  
                              },
                              isSelect: controller.isSelect(2),
                              genreName: "Fantasia",
                            ),
                            GenreTabBar(
                              onTap: (){
                                controller.setSelectedTabBarIndex(3);
                                controller.getMoviesResultList(COMEDY_GENRE_ID, 1);
                                },
                              isSelect: controller.isSelect(3),
                              genreName: "Comédia",
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
