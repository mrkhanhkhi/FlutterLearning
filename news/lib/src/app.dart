import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  // const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StoriesProvider(
      child:  MaterialApp(
      title: 'News',
      home: NewsList(),
      ),
    );
  }
} 