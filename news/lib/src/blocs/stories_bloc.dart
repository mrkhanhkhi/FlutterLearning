import 'package:news/resources/news_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';
import 'dart:async';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();

  Observable<Map<int, Future<ItemModel>>>items;

  // Getters to get streams
  Observable<List<int>> get topIds => _topIds.stream;
  
  // Getters to Sinks
  Function(int) get fetchItem => _items.sink.add;
  
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);  
  }

  StoriesBloc() {
    items = _items.stream.transform(_itemsTranformer());
  }

  _itemsTranformer() {
    return ScanStreamTransformer(
        (Map <int , Future<ItemModel>> cache, int id, _ ) {
            cache[id] = _repository.fetchItem(id);
            return cache;
        },
        <int, Future<ItemModel>>{
          
        },
    );
  }

  dispose() {
    _topIds.close();
    _items.close();
  }
}