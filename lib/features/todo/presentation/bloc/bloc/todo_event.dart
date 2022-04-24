part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel todoModel;

  const AddTodo({required this.todoModel});

  @override
  List<Object> get props => [todoModel];
}

class DeleteTodo extends TodoEvent {
  final TodoModel todoModel;
  const DeleteTodo({
    required this.todoModel,
  });
  @override
  List<Object> get props => [todoModel];
}

class IsDoneClicked extends TodoEvent {
  final TodoModel todoModel;
  const IsDoneClicked({
    required this.todoModel,
  });
}

class IsReminderClicked extends TodoEvent {
  final TodoModel todoModel;
  const IsReminderClicked({
    required this.todoModel,
  });
}
