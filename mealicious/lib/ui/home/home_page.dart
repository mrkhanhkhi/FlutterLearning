import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mealicious/common/centered_message.dart';
import 'package:mealicious/ui/category/bloc/bloc.dart';
import 'package:mealicious/ui/latest_meals/bloc/latest_meals_bloc.dart';
import 'package:mealicious/ui/latest_meals/bloc/latest_meals_event.dart';
import 'package:mealicious/ui/latest_meals/bloc/latest_meals_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _latestMealsBloc = kiwi.Container().resolve<LatestMealsBloc>();
  final _categoriesBloc = kiwi.Container().resolve<CategoryBloc>();
  @override
  void initState() {
    super.initState();
    _latestMealsBloc.add(StartLoadMeal());
    _categoriesBloc.add(StartLoadCategories());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(create: (context) => _categoriesBloc),
        BlocProvider<LatestMealsBloc>(create: (context) => _latestMealsBloc),
      ],
      child: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Text('Categories',
                  style: TextStyle(
                    fontSize: 30.0,
                  )),
              _buildCategories(),
              Text('Latest',
                  style: TextStyle(
                    fontSize: 30.0,
                  )),
              _buildLatestList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      child: BlocBuilder(
        bloc: _categoriesBloc,
        builder: (context, CategoryState state) {
          if (state is CategoriesLoaded) {
            return _buildCategoriesList(state);
          }

          if (state is CategoriesLoading) {
            return _buildLoaderListITem();
          } else {
            return CenteredMessage(message: "Error", icon: Icons.error_outline);
          }
        },
      ),
    );
  }

  Widget _buildLatestList() {
    return Container(
      child: BlocBuilder(
        bloc: _latestMealsBloc,
        builder: (context, LatestMealsState state) {
          if (state is MealLoaded) {
            return _buildLatestMealList(state);
          }

          if (state is MealLoading) {
            return _buildLoaderListITem();
          } else {
            return CenteredMessage(message: "Error", icon: Icons.error_outline);
          }
        },
      ),
    );
  }

  Widget _buildLoaderListITem() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildCategoriesList(CategoriesLoaded state) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 180.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.0,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Container(
                                height: 80.0,
                                width: 80.0,
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                        width: 2.0,
                                        style: BorderStyle.solid,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state
                                            .categories[index]
                                            .strCategoryThumb))))),
                        Text(
                          state.categories[index].strCategory,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  Widget _buildLatestMealList(MealLoaded state) {
    return Center(
      child: ClipRect(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    state.meals[index].strMealThumb))),
                        child: Center(
                            child: Text(
                          state.meals[index].strMeal,
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        )),
                      ),
                    ),
                  );
                })),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _latestMealsBloc.close();
    _categoriesBloc.close();
  }

  // Widget _buildMealItemCard(SearchSnippet videoSnippet) {
  //   return Card(
  //                 color: Colors.blue,
  //                 child: Container(
  //                   child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
  //                 );
  // }
}
