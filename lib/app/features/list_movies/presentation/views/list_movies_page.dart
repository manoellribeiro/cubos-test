import '../../../../core/configs/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/size_config.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/genre_tab_bar_widget.dart';
import '../widgets/movies_listview_widget.dart';
import '../widgets/rounded_search_textfield_widget.dart';
import 'controller/list_movies_controller.dart';

class ListMoviesPage extends StatefulWidget {
  @override
  _ListMoviesPageState createState() => _ListMoviesPageState();
}

class _ListMoviesPageState
    extends ModularState<ListMoviesPage, ListMoviesController> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        bool isScrollAtEdge = scrollController.position.atEdge;
        bool isScrollNotOnTop = scrollController.position.pixels != 0.0;
        bool isScrollOnBottom = isScrollAtEdge && isScrollNotOnTop;
        bool shouldFetchMovies = isScrollOnBottom && !controller.isFiltering;
        if (shouldFetchMovies) {
          controller.fetchMoreMovies();
        }
      });
    controller.getMoviesResultList(ACTION_GENRE_ID, 1);
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
                    height: SizeConfig.heightMultiplier * 25,
                    width: SizeConfig.widthMultiplier * 100,
                  ),
                  Expanded(
                    child: Observer(builder: (_) {
                      if (controller.checkForState(ListPageStates.loading))
                        return Center(child: CircularProgressIndicator());
                      if (controller.checkForState(ListPageStates.success))
                        return MoviesListView(
                          scrollController: scrollController,
                        );
                      if (controller.checkForState(ListPageStates.failure))
                        return Center(
                            child: Text(
                          controller.failure.message,
                          style: TextStyle(color: Colors.black),
                        ));
                      return Container(child: Center(child: Text("Failure")));
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
                        Strings.movies,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      RoundedSearchTextField(
                        onChanged: controller.setFilter,
                        labelText: Strings.moviesSearch,
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
                                controller.getMoviesResultList(
                                    ACTION_GENRE_ID, 1);
                              },
                              isSelect: controller.isSelect(0),
                              genreName: Strings.action,
                            ),
                            GenreTabBar(
                              onTap: () {
                                controller.setSelectedTabBarIndex(1);
                                controller.getMoviesResultList(
                                    ADVENTURE_GENRE_ID, 1);
                              },
                              isSelect: controller.isSelect(1),
                              genreName: Strings.adventure,
                            ),
                            GenreTabBar(
                              onTap: () {
                                controller.setSelectedTabBarIndex(2);
                                controller.getMoviesResultList(
                                    FANTASY_GENRE_ID, 1);
                              },
                              isSelect: controller.isSelect(2),
                              genreName: Strings.fantasy,
                            ),
                            GenreTabBar(
                              onTap: () {
                                controller.setSelectedTabBarIndex(3);
                                controller.getMoviesResultList(
                                    COMEDY_GENRE_ID, 1);
                              },
                              isSelect: controller.isSelect(3),
                              genreName: Strings.comedy,
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
