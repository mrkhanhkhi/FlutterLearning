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
      child: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  Widget _buildLatestMealsList() {
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

  Widget _buildLatestMealList(MealLoaded state) {
    return Center(
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
                    color: Colors.blue,
                    child: Container(
                      child: Center(
                          child: Text(
                        state.meals[index].strMeal,
                        style: TextStyle(color: Colors.white, fontSize: 36.0),
                      )),
                    ),
                  ),
                );
              })),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _latestMealsBloc.close();
  }

  // Widget _buildMealItemCard(SearchSnippet videoSnippet) {
  //   return Card(
  //                 color: Colors.blue,
  //                 child: Container(
  //                   child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
  //                 );
  // }
}
