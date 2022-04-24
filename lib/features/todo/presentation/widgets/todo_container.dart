import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({Key? key, required this.todoModel}) : super(key: key);
  final TodoModel todoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
      child: Slidable(
        enabled: true,
        direction: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<TodoBloc>(context)
                  .add(DeleteTodo(todoModel: todoModel));
              BlocProvider.of<TodoBloc>(context).add(GetAllTodos());
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 207, 207, 1),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
              ),
            ),
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 55.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4.0,
                height: 55.0,
                decoration: BoxDecoration(
                    color: Color(todoModel.color),
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              const SizedBox(
                width: 11.0,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<TodoBloc>(context)
                      .add(IsDoneClicked(todoModel: todoModel));
                  // BlocProvider.of<TodoBloc>(context).add(GetAllTodos());
                },
                child: Container(
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    color: todoModel.isDone
                        ? const Color.fromRGBO(145, 220, 90, 1)
                        : null,
                    borderRadius: BorderRadius.circular(9.0),
                    border: Border.all(
                      color: const Color.fromRGBO(218, 218, 218, 1),
                    ),
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 11.0,
              ),
              Text(
                DateFormat.jm().format(todoModel.time),
                style: const TextStyle(
                  fontFamily: "Rubik",
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(
                width: 11.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  todoModel.todoTitle,
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 15.0,
                    color: todoModel.isDone
                        ? const Color.fromRGBO(217, 217, 217, 1)
                        : const Color.fromRGBO(85, 78, 143, 1),
                    fontWeight:
                        todoModel.isDone ? FontWeight.w500 : FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                width: 11.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 14.0),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(IsReminderClicked(todoModel: todoModel));
                        BlocProvider.of<TodoBloc>(context).add(GetAllTodos());
                      },
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(
                          Icons.notifications,
                          size: 20.0,
                          color: todoModel.isReminder
                              ? const Color.fromRGBO(255, 220, 0, 1)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
