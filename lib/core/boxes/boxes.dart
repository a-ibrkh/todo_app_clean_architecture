import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_local/core/keys/app_keys.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';

class Boxes {
  static Box<TodoModel> getTodosBox() => Hive.box<TodoModel>(AppKeys.todos);
}
