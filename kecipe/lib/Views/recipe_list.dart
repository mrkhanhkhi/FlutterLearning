import 'package:flutter/material.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_bloc.dart';
import 'package:kecipe/Views/recipe_card.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/Views/recipe_detail.dart';

class RecipeList extends StatefulWidget {
  final String type;

  const RecipeList({Key key, this.type}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  void initState() {
    super.initState();
    bloc.getMeal(widget.type);
    print(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MealModel>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<MealModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.error != null && snapshot.error.hashCode > 0) {
            return _buildErrorWidget(snapshot.error);
          }
          return buildRecipeListView(snapshot.data.hits);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecipeList'),
        backgroundColor: Constants.lightPrimary,
      ),
      body: Center(
        child: new CircularProgressIndicator(),
      ),
    );
//    return Container(
//      color: Colors.transparent,
//      child: new Center(
//        child: new CircularProgressIndicator(),
//      ),
//    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget buildRecipeListView(List<Hits> hits) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: hits.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6),
            itemBuilder: (BuildContext context, int index){
              return RecipeCard(recipe: hits[index].recipe, onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {return RecipeDetail(recipe: hits[index].recipe,);
                    }
                    )
                );
                }
              );
            }),
      ),
    );
  }

  Widget displayItem(String key, String value){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text('$key : $value', style: TextStyle(fontSize: 11),),
    );
  }

  Widget buildNestedScrollViewWidget(MealModel meal) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  meal.hits[0].recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }
}
