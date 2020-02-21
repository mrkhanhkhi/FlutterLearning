import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mealicious_prov/data/database/favorite_db.dart';

class FavoritesProvider extends ChangeNotifier {
  String message;
  List posts = List();
  bool loading = true;
  var db = FavoriteDB();

  getFeed() async {
    setLoading(true);
    posts.clear();
    db.listAll().then((all) {
      posts.addAll(all);
      setLoading(false);
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setMessage(value) {
    message = value;
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
    notifyListeners();
  }

  String getMessage() {
    return message;
  }

  void setPosts(value) {
    posts = value;
    notifyListeners();
  }

  List getPosts() {
    return posts;
  }
}
