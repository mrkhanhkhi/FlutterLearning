import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';
import 'blocs/comments_provider.dart';

class App extends StatelessWidget {
  // const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
      child: MaterialApp(
        title: 'News',
        home: NewsList(),
        onGenerateRoute: routes
      ),
    ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return NewsList();
        }
      );
    } else {
      return MaterialPageRoute(builder: (context) {
        final itemId = int.parse(settings.name.replaceFirst('/', ''));
        final commentBloc = CommentsProvider.of(context);
        commentBloc.fetchItemWithComments(itemId);
        
        return NewsDetail(
          itemId: itemId
        );
        }
      );
    }
  }
}
