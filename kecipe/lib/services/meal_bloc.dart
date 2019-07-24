import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final MealRepository _mealRepository = MealRepository();
  String type = '';

  PublishSubject<List<Hits>> _hitsController = PublishSubject<List<Hits>>();
  Sink<List<Hits>> get _inHitList => _hitsController.sink;
  Stream<List<Hits>> get outHitList => _hitsController.stream;

  // ///
  // /// Each time we need to render a MovieCard, we will pass its [index]
  // /// so that, we will be able to check whether it has already been fetched
  // /// If not, we will automatically fetch the page
  // ///
  // PublishSubject<int> _indexController = PublishSubject<int>();
  // Sink<int> get inMovieIndex => _indexController.sink;

  MealBloc(this.type) {
    _hitsController.stream
                    // take some time before jumping into the request (there might be several ones in a row)
                    .bufferTime(Duration(microseconds: 500))
                    // and, do not update where this is no need
                    .where((batch) => batch.isNotEmpty)
                    .listen(getMeal(type));
  }

  getMeal(String mealType) async {
    MealModel response = await _mealRepository.getMeals(mealType);
    _inHitList.add(response.hits);
  }

  dispose() {
    _hitsController.close();
  }
}

