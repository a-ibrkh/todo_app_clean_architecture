import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_local/core/boxes/boxes.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/no_task_widget.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/reminder_container.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/todo_container.dart';

import '../../bloc/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(249, 252, 255, 1),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                context.read<TodoBloc>().add(GetAllTodos());
                if (state is Loaded) {
                  if (state.todoModelList.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: NoTasksWidget(),
                    );
                  } else {
                    TodoModel? isReminderModel;
                    for (var i = 0; i < state.todoModelList.length; i++) {
                      if (state.todoModelList[i].isReminder) {
                        isReminderModel = state.todoModelList[i];
                        break;
                      }
                    }

                    return Column(
                      children: [
                        isReminderModel != null
                            ? Container(
                                height: 130.0,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(56, 103, 213, 1),
                                      Color.fromRGBO(129, 199, 245, 1),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: ReminderContainer(
                                      todoModel: isReminderModel,
                                    )),
                              )
                            : Container(),
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.todoModelList.length,
                              itemBuilder: (context, index) {
                                return TodoContainer(
                                    todoModel: state.todoModelList[index]);
                              }),
                        ),
                      ],
                    );
                  }
                } else {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
