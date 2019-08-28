import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../model/item_model.dart';
import 'news_repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  Future<List<int>>  fetchTopIds() {
    return null;
  }

  void init() async {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      final path = join(documentsDirectory.path, "item.db");
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database newDb, int version) {
          newDb.execute("""
            CREATE TABLE items
              (
                id INTEGER PRIMARY KEY,
                type TEXT,
                by TEXT,
                time INTEGER,
                parent INTEGER,
                kids BLOB,
                dead INTEGER,
                title TEXT,
                descendants INTEGER
              )
          """);
        },
      );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }
}

final newsDbProvider = NewsDbProvider();