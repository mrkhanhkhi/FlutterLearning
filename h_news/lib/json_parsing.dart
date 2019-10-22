import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'dart:convert' as json;

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  // Fields
  int get id;
   bool get deleted;
   String get type;
   String get by;
   int get time;
   String get text;
   bool get dead;
   int get parent;
   BuiltList<int> get kids;
   String get url;
   int get score;
   String get title;
   int get descendants;
   BuiltList<int> get parts;
  Article._();



  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseTopStories(String jsonString) {
  return List<int>();

  // final parsed = json.jsonDecode(jsonString);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
}


Article parseArticle(String jsonString) {
    final parsed = json.jsonDecode(jsonString);
    return null;
}

