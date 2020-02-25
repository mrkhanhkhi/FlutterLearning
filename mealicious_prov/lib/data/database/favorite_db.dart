import 'dart:io';

import 'package:mealicious_prov/data/database/app_database.dart';
import 'package:mealicious_prov/data/model/meal_model.dart';
import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

class FavoriteDB {
  getPath() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = documentDirectory.path + '/favorites.db';
    return path;
  }

  //Insertion
  add(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    db.insert(item);
    db.tidy();
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    int val = await db.remove(item);
    db.tidy();
    await db.close();
    return val;
  }

  Future<List> listAll() async {
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find({});
    db.tidy();
    await db.close();
    return val;
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(await getPath());
    db.open();
    List val = await db.find(item);
    db.tidy();
    await db.close();
    return val;
  }
}

class FavDB {
  static const String FAV_STORE_NAME = 'fav';

  final _favStore = intMapStoreFactory.store(FAV_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future check(MealDetail meal) async {
    var finder = Finder(filter: Filter.byKey(meal.id));
    var record = await _favStore.find(await _db, finder: finder);
    if (record.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future insert(MealDetail meal) async {
    await _favStore.add(await _db, meal.toMap());
  }

  Future update(MealDetail meal) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(meal.id));
    await _favStore.update(
      await _db,
      meal.toMap(),
      finder: finder,
    );
  }

  Future delete(MealDetail meal) async {
    final finder = Finder(filter: Filter.byKey(meal.id));
    await _favStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<MealDetail>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('strMeal'),
    ]);

    final recordSnapshots = await _favStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final meal = MealDetail.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      meal.id = snapshot.key;
      return meal;
    }).toList();
  }
}
