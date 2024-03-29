library video_snippet;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search/data/model/common/model_common.dart';
import 'package:youtube_search/data/model/serializer/serializers.dart';

part 'video_snippet.g.dart';

abstract class VideoSnippet
    implements Built<VideoSnippet, VideoSnippetBuilder> {
  // fields go here
  String get publishedAt;
  String get channelId;
  String get title;
  String get description;
  String get channelTitle;
  Thumbnails get thumbnails;
  BuiltList<String> get tags;

  VideoSnippet._();

  factory VideoSnippet([updates(VideoSnippetBuilder b)]) = _$VideoSnippet;

  String toJson() {
    return json
        .encode(serializers.serializeWith(VideoSnippet.serializer, this));
  }

  static VideoSnippet fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoSnippet.serializer, json.decode(jsonString));
  }

  static Serializer<VideoSnippet> get serializer => _$videoSnippetSerializer;
}
