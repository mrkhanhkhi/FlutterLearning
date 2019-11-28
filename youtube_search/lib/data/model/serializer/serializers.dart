library serializers;

import 'dart:convert';
import 'package:youtube_search/data/model/common/model_common.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:youtube_search/data/model/detail/video_item.dart';
import 'package:youtube_search/data/model/detail/video_snippet.dart';
import 'package:youtube_search/data/model/detail/youtube_video_response.dart';
import 'package:youtube_search/data/model/search/modeal_search.dart';
import 'package:youtube_search/data/model/detail/model_detail.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  YoutubeSearchResult,
  SearchItem,
  Id,
  SearchSnippet,
  Thumbnails,
  Thumbnail,
  YoutubeVideoResponse,
  VideoItem,
  VideoSnippet,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
