import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../model/item_model.dart';

class NewsDbProvider {
  Database db;



  init() async {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      final path = join(docu)
  }
}