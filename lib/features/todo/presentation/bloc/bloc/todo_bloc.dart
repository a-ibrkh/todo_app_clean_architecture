import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_local/core/keys/app_keys.dart';

import '../../../../../core/boxes/boxes.dart';
import '../../../data/models/todo_model.dart';
import '../../../domain/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

const String CACHEFAILUREMESSAGE = "Cache failure";

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(Loading()) {
    on<GetAllTodos>(
      (event, emit) async {
        await _getTodos(event, emit);
      },
    );
    on<AddTodo>((event, emit) async {
      await _addTodo(event, emit);
    });
    on<DeleteTodo>((event, emit) async {
      await _deleteTodo(event, emit);
    });
    on<IsDoneClicked>((event, emit) async {
      await _isDoneClicked(event, emit);
    });
    on<IsReminderClicked>((event, emit) async {
      await _isReminderClicked(event, emit);
    });
  }

  Future<void> _getTodos(GetAllTodos event, Emitter<TodoState> emit) async {
    emit(Loading());
    final failureOrList = await repository.getTodos();
    failureOrList.fold((failure) async {
      emit(const Error(errorMessage: CACHEFAILUREMESSAGE));
    }, (listOfTodos) async {
      emit(
        Loaded(listOfTodos.cast<TodoModel>()),
      );
    });
  }

  Future<void> _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    await repository.deleteTodo(todoModel: event.todoModel);
  }

  Future<void> _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    final modelToAdd = event.todoModel;
    await repository.addTodo(todoModel: modelToAdd);
  }

  Future<void> _isDoneClicked(
      IsDoneClicked event, Emitter<TodoState> emit) async {
    await repository.editTodo(
        todoModel: event.todoModel, isDone: !event.todoModel.isDone);
  }

  Future<void> _isReminderClicked(
      IsReminderClicked event, Emitter<TodoState> emit) async {
    await repository.editTodo(
        todoModel: event.todoModel, isReminder: !event.todoModel.isReminder);
  }

  @override
  Future<void> close() async {
    await Hive.close();
    return super.close();
  }
}
