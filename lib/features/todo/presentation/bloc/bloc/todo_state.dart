part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}


class Loading extends TodoState {}

class Loaded extends TodoState {
  final List<TodoModel> todoModelList;

  const Loaded(this.todoModelList);

  @override
  List<Object> get props => [todoModelList];
}

class Error extends TodoState {
 final String errorMessage;
 const Error({
    required this.errorMessage,
  });

  @override 
  List<Object> get props => [errorMessage];
}
