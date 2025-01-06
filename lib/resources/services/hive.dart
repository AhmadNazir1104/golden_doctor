import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static String localWishList = 'WsihListBox';
  static String localCart = 'CartBox';

  // static Box<WishlistModel>? locaWishListBox;
  // static Box<CartModel>? locaCartBox;

  static Future hiveinitialize() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive
      .init(directory.path);
      // ..registerAdapter(WishListAdapter())
      // ..registerAdapter(CartModelAdapter());
    // locaWishListBox = await Hive.openBox<WishlistModel>(localWishList);
  }

  static getFromHive({required String table, required String key}) async {
    var box = Hive.box(table);
    var list = await box.get(key);
    return list;
  }

  static addToHive({required String table, required String key, dynamic data}) {
    String response = "";
    // adding to hive DB.
    var box = Hive.box(table);
    box.put(key, data).then((value) {
      // print("Cart added to hive");
    }).onError((error, stackTrace) {
      // print("Error in adding cart to hive");
      // print(error);
      // print(stackTrace);
      response = error.toString();
    });
    return response;
  }

  static deleteFromHive(
      {required String table, required String key, required int index}) async {
    var box = Hive.box(table);
    List list = await box.get(key);
    list.removeAt(index);
    box.put(key, list);
  }
}

class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });
}

class TodoSaverService {
  static const _boxName = 'todos';

  static Future<void> init() async {
    await Hive.openBox<Todo>(_boxName);
  }

  static Future<void> saveTodo(Todo todo) async {
    final box = await Hive.openBox<Todo>(_boxName);
    await box.put(todo.id, todo);
  }

  static Future<void> removeTodo(String todoId) async {
    final box = await Hive.openBox<Todo>(_boxName);
    await box.delete(todoId);
  }

  static Future<List<Todo>> getTodos() async {
    final box = await Hive.openBox<Todo>(_boxName);
    return box.values.toList();
  }
}
