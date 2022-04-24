import 'dart:developer';

import 'package:todo_app_local/core/boxes/boxes.dart';
import 'package:todo_app_local/core/errors/exceptions.dart';

import '../models/todo_model.dart';

abstract class TodoLocalDatasource {
  Future<void> addMyTodo({required TodoModel todoModel});
  Future<List<TodoModel>> getMyTodos();

  Future<void> editMyTodo(
      {required TodoModel todoModel, bool? isDone, bool? isReminder});
  Future<void> deleteMyTodo({required TodoModel todoModel});
}

class TodoLocalDatasourceImpl extends TodoLocalDatasource {
  final box = Boxes.getTodosBox();

  @override
  Future<void> addMyTodo({required TodoModel todoModel}) async {
    final todoToCache = TodoModel(
        todoTitle: todoModel.todoTitle,
        color: todoModel.color,
        isDone: todoModel.isDone,
        isReminder: todoModel.isReminder,
        time: todoModel.time);

    await box.add(todoToCache);
  }

  @override
  Future<void> deleteMyTodo({required TodoModel todoModel}) async {
    await todoModel.delete();
  }

  @override
  Future<void> editMyTodo(
      {required TodoModel todoModel, bool? isDone, bool? isReminder}) async {
    todoModel.isDone = isDone ?? todoModel.isDone;
    todoModel.isReminder = isReminder ?? todoModel.isReminder;
    final modelKey = todoModel.key;
    log(modelKey.toString());
    box.put(modelKey, todoModel);
    // await todoModel.save();
  }

  @override
  Future<List<TodoModel>> getMyTodos() async {
    final boxValues = box.values.toList().cast<TodoModel>();

    if (boxValues == null) {
      throw CacheException();
    } else {
      return boxValues;
    }
  }
}
