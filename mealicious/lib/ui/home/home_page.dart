import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mealicious/common/centered_message.dart';
import 'package:mealicious/ui/home/bloc/home_bloc.dart';
import 'package:mealicious/ui/home/bloc/home_event.dart';
import 'package:mealicious/ui/home/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = kiwi.Container().resolve<HomeBloc>();
  @override
  void initState() {
    super.initState();
    _homeBloc.dispatch(FetchInitated());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _homeBloc,
      child: _buildScaffold(),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: null,
      body: BlocBuilder(
        bloc: _homeBloc,
        builder: (context, HomeState state) {
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

  // Widget _buildMealItemCard(SearchSnippet videoSnippet) {
  //   return Card(
  //                 color: Colors.blue,
  //                 child: Container(
  //                   child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
  //                 );
  // }
}
