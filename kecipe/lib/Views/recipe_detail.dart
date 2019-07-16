import 'package:flutter/material.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_bloc.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  RecipeDetail({this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
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
                title: null,
                background: CachedNetworkImage(
                  placeholder: (context, url) => new SizedBox(
                        child: CircularProgressIndicator(),
                        height: 20.0,
                        width: 20.0,
                      ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  imageUrl: widget.recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(widget.recipe.label,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.recipe.ingredientLines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 50,
                          child: Text(widget.recipe.ingredientLines[index]));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
                child: FloatingActionButton.extended(
                  elevation: 4.0,
                  icon: const Icon(Icons.search),
                  label: const Text('View full recipes'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebviewScaffold(
                              url: widget.recipe.url,
                              appBar: new AppBar(
                                title: Text(widget.recipe.label),
                              ),
                              withZoom: true,
                              withLocalStorage: true,
                              hidden: true,
                              initialChild: Container(
                                color: Colors.white,
                                child: const Center(
                                  child: Text('Waiting.....'),
                                ),
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

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}
