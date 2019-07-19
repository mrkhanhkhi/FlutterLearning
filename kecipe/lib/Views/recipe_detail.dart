import 'package:flutter/material.dart';
import 'package:kecipe/Views/nutrition_fact.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:kecipe/Views/recipe_image.dart';
import 'package:kecipe/Views/recipe_title.dart';
import 'recipe_nutrition.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  RecipeDetail({this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 340.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: null,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RecipeImage(widget.recipe.image),
                      RecipeTitle(widget.recipe, 25.0)
                    ],
                  )),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: "Ingredients"),
                  Tab(text: "Nutrition"),
                  Tab(text: "Nutrition Fact")
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    IngredientsView(widget.recipe.ingredientLines),
                    RecipeNutrition(recipe: widget.recipe, padding: 20.0,),
                    NutritionFact(recipe: widget.recipe,)
                  ],
                  controller: _tabController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 80.0, 50.0, 20.0),
                child: FloatingActionButton.extended(
                  elevation: 4.0,
                  icon: const Icon(Icons.search),
                  label: const Text('View full recipes'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text('Flutter WebView example'),
                                ),
                                body: WebView(
                                  initialUrl: widget.recipe.url,
                                  javascriptMode: JavascriptMode.unrestricted,
                                ),
                              ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class IngredientsView extends StatelessWidget {
  final List<String> ingredients;

  IngredientsView(this.ingredients);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    ingredients.forEach((item) {
      children.add(
        new Row(
          children: <Widget>[
            new Icon(Icons.done),
            new SizedBox(width: 5.0),
            Flexible(
              child: new Text(item,
              maxLines: 3,),
            ),
          ],
        ),
      );
      // Add spacing between the lines:
      children.add(
        new SizedBox(
          height: 5.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: children,
    );
  }
}
