import 'package:news/resources/news_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';
import 'dart:async';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher =  PublishSubject<int>();


  // Getters to get streams
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;
  
  // Input
  // Getters to Sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;
  
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);  
  }

  clearCache(){
    return _repository.clearCache();
  }

  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTranformer()).pipe(_itemsOutput);
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
    _itemsOutput.close();
    _itemsFetcher.close();
  }
}