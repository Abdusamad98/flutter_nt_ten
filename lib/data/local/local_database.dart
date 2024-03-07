import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/coffee_model.dart';
import 'package:flutter_nt_ten/data/repositories/coffee_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  //Step 1
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  //-----
  //Step 2
  Database? _database;

  //Step 3
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("coffees.db");
      return _database!;
    }
  }

  //Step 4
  Future<Database> _init(String databaseName) async {
    //......Android/data
    String internalPath = await getDatabasesPath();
    //......Android/data/todo.db
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //--------------------------READY TO USE------------------------

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";
    const floatType = "FLOAT DEFAULT 0.0";

    await db.execute('''CREATE TABLE coffees (
      _id $idType,
      name $textType,
      description $textType,
      type $textType,
      image_path $textType,
      category_id $intType,
      count $intType,
      rate $floatType,
      is_favourite $intType,
      subtitle $textType,
      price $floatType
    )''');
  }

  //------------------TASKS--------------------------------------

  static Future<CoffeeModel> insertCoffee(CoffeeModel coffeeModel) async {
    debugPrint("INITIAL ID:${coffeeModel.dbId}");
    final db = await databaseInstance.database;
    int savedCoffeeID = await db.insert("coffees", coffeeModel.toJson());
    debugPrint("SAVED ID:$savedCoffeeID");
    return coffeeModel.copyWith(dbId: savedCoffeeID);
  }

  static Future<List<CoffeeModel>> getAllCoffees() async {
    final db = await databaseInstance.database;
    String orderBy = "_id DESC"; //"_id DESC"
    List json = await db.query("coffees", orderBy: orderBy);
    return json.map((e) => CoffeeModel.fromJson(e)).toList();
  }

  static Future<int> deleteCoffee(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      "coffees",
      where: "_id = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static Future<int> updateCoffee(
    CoffeeModel coffeeModel,
    int id,
  ) async {
    debugPrint("UPDATE: ${coffeeModel.toJson()} ${coffeeModel.dbId}");
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "coffees",
      coffeeModel.toJson(),
      where: "_id = ?",
      whereArgs: [id],
    );
    return updatedTaskId;
  }

  static Future<int> updateCoffeeCount({
    required int count,
    required int coffeeId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "coffees",
      {"count": count},
      where: "_id = ?",
      whereArgs: [coffeeId],
    );
    return updatedTaskId;
  }

  static Future<int> updateCoffeeFavourite({
    required bool isFavourite,
    required int coffeeId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "coffees",
      {
        "is_favourite": isFavourite ? 1 : 0,
      },
      where: "_id = ?",
      whereArgs: [coffeeId],
    );
    return updatedTaskId;
  }
}

fillDBIfEmpty() async {
  List<CoffeeModel> list = await LocalDatabase.getAllCoffees();
  if (list.isEmpty) {
    for (var coffeeModel in staticCoffeesList) {
      await LocalDatabase.insertCoffee(coffeeModel);
    }
  }
}
