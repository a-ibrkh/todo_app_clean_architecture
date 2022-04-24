import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_local/core/errors/failures.dart';

import '../../data/models/todo_model.dart';

abstract class TodoRepository {
  Future<void> addTodo({required TodoModel todoModel});
  Future<Either<FailureImpl, List<TodoModel>>> getTodos();
  Future<void> editTodo({required TodoModel todoModel});
  Future<void> deleteTodo({required TodoModel todoModel});
}
