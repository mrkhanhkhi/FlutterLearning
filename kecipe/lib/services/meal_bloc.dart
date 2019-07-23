import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kecipe/services/bloc_base.dart';

class RecipeBloc implements BlocBase {
  // final MealRepository _mealRepository = MealRepository();
  // final PublishSubject<RecipeModel> _subject =
  // PublishSubject<RecipeModel>();
  final String mealType = "";

  PublishSubject<List<RecipeModel>> _recipesController = PublishSubject<List<RecipeModel>>();
  Sink<List<RecipeModel>> get _inRecipesList => _recipesController.sink;
  Stream<List<RecipeModel>> get outRecipesList => _recipesController.stream;

  RecipeBloc() {
    _recipesController.stream
     // take some time before jumping into the request (there might be several ones in a row)
                    .bufferTime(Duration(microseconds: 500))
                    // and, do not update where this is no need
                    .where((batch) => batch.isNotEmpty)
                    .listen(getMeal());
  }

  getMeal() async {
    api.recipeList(type: mealType);
  }

  dispose() {
    _recipesController.close();
    _inRecipesList.close();
  }

}

RecipeAPI api = RecipeAPI();
final bloc = RecipeBloc();