import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_search/data/model/search/youtube_search_error.dart';
import 'package:youtube_search/data/model/search/youtube_search_result.dart';
import 'package:youtube_search/data/network/api_key.dart';

const int MAX_SEARCH_RESULT = 5;

class YoutubeDataSource {
  final http.Client client;

  final String _searchBseUrl =
      'https://www.googleapis.com/youtube/v3/search?part=snippet' +
          '&maxResults=$MAX_SEARCH_RESULT&type=video&key=$API_KEY';

  YoutubeDataSource(this.client);

  Future<YoutubeSearchResult> searchVideos({
    String query,
    String pageToken = '',
  }) async {
    final urlRaw = _searchBseUrl +
        "&q=$query" +
        (pageToken.isNotEmpty ? '&pageToken=$pageToken' : '');
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return YoutubeSearchResult.fromJson(response.body);
    } else {
      throw YoutubeSearchError(json.decode(response.body)['error']['message']);
    }
  }
}
