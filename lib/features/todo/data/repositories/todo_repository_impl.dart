import 'package:todo_app_local/core/errors/exceptions.dart';
import 'package:todo_app_local/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app_local/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';

import 'package:todo_app_local/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource localDatasource;

  TodoRepositoryImpl({required this.localDatasource});

  @override
  Future<void> addTodo({required TodoModel todoModel}) async {
    await localDatasource.addMyTodo(todoModel: todoModel);
  }

  @override
  Future<Either<FailureImpl, List<TodoModel>>> getTodos() async {
    try {
      final localTodos = await localDatasource.getMyTodos();
      return Right(localTodos);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> editTodo(
      {required TodoModel todoModel, bool? isDone, bool? isReminder}) async {
    await localDatasource.editMyTodo(
        todoModel: todoModel, isDone: isDone, isReminder: isReminder);
  }

  @override
  Future<void> deleteTodo({required TodoModel todoModel}) async {
    await localDatasource.deleteMyTodo(todoModel: todoModel);
  }
}
