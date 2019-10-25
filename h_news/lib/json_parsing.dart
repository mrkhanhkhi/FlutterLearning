// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'dart:convert' as json;
// import 'serializers.dart';


// part 'json_parsing.g.dart';

// abstract class Article implements Built<Article, ArticleBuilder> {

//   static Serializer<Article> get serializer => _$articleSerializer;
//   // Fields
//   @nullable int get id;
//   @nullable bool get deleted;
//   @nullable String get type;
//   @nullable String get by;
//   @nullable int get time;
//   @nullable String get text;
//   @nullable bool get dead;
//   @nullable int get parent;
//   @nullable BuiltList<int> get kids;
//   @nullable String get url;
//   @nullable int get score;
//   @nullable String get title;
//   @nullable int get descendants;
//   @nullable BuiltList<int> get parts;
//   Article._();



//   factory Article([void Function(ArticleBuilder) updates]) = _$Article;
// }

// List<int> parseTopStories(String jsonString) {
//   return List<int>();

//   // final parsed = json.jsonDecode(jsonString);
//   // final listOfIds = List<int>.from(parsed);
//   // return listOfIds;
// }


// Article parseArticle(String jsonString) {
//     final parsed = json.jsonDecode(jsonString);
//     Article article = standardSerializers.deserializeWith(Article.serializer, parsed);   
//     return article;
// }

