import 'package:news/resources/news_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:news/model/item_model.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  // Getters to get streams
  Observable<List<int>> get topIds => _topIds.stream;
  

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);  
  }

  dispose() {
    _topIds.close();
  }
}