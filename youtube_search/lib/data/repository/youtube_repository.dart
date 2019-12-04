import 'package:built_collection/built_collection.dart';
import 'package:youtube_search/data/model/detail/model_detail.dart';
import 'package:youtube_search/data/model/search/search_item.dart';
import 'package:youtube_search/data/network/youtube_data_source.dart';

class YoutubeRepository {
  YoutubeDataSource _youtubeDataSource;

  String _lastSearchQuery;
  String _nextPageToken;

  YoutubeRepository(this._youtubeDataSource);

  Future<BuiltList<SearchItem>> searchVideos(String query) async {
    final searchResult = await _youtubeDataSource.searchVideos(query: query);
    _cachedValues(query: query, nextPageToken: searchResult.nextPageToken);
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  void _cachedValues({String query, String nextPageToken}) {
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
  }

  Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitializedException();
    }

    if (_nextPageToken == null) {
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult = await _youtubeDataSource.searchVideos(
        query: _lastSearchQuery, pageToken: _nextPageToken);
    _cachedValues(
        query: _lastSearchQuery,
        nextPageToken: nextPageSearchResult.nextPageToken);

    return nextPageSearchResult.items;
  }

  Future<VideoItem> fetchVideoInfo({String id}) async {
    final videoResponse = await _youtubeDataSource.fetchVideoInfo(id: id);
    if (videoResponse.items.isEmpty) throw NoSuchVideoException();
    return videoResponse.items[0];
  }
}

class NoSuchVideoException implements Exception {
  final message = 'No such video';
}

class NoSearchResultsException implements Exception {
  final message = "No results";
}

class SearchNotInitializedException implements Exception {
  final message = 'Search not intialized';
}

class NoNextPageTokenException implements Exception {
  final message = 'No next page token';
}
