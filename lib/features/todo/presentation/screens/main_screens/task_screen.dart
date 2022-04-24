import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/task_container.dart';

import '../../../data/models/todo_model.dart';
import '../../bloc/bloc/todo_bloc.dart';
import '../../widgets/no_task_widget.dart';
import '../../widgets/reminder_container.dart';
import '../../widgets/todo_container.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

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
                  {
                    int yellowCount = 0;
                    int greenCount = 0;
                    int purpleCount = 0;
                    int orangeCount = 0;
                    int blueCount = 0;
                    TodoModel? isReminderModel;
                    for (var i = 0; i < state.todoModelList.length; i++) {
                      if (state.todoModelList[i].isReminder) {
                        isReminderModel = state.todoModelList[i];
                        break;
                      }
                    }
                    for (var i = 0; i < state.todoModelList.length; i++) {
                      if (state.todoModelList[i].color ==
                          const Color.fromRGBO(255, 213, 6, 1).value) {
                        yellowCount++;
                      } else if (state.todoModelList[i].color ==
                          const Color.fromRGBO(30, 209, 2, 1).value) {
                        greenCount++;
                      } else if (state.todoModelList[i].color ==
                          const Color.fromRGBO(209, 2, 99, 1).value) {
                        purpleCount++;
                      } else if (state.todoModelList[i].color ==
                          const Color.fromRGBO(48, 68, 242, 1).value) {
                        blueCount++;
                      } else if (state.todoModelList[i].color ==
                          const Color.fromRGBO(242, 145, 48, 1).value) {
                        orangeCount++;
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
                                  ),
                                ),
                              )
                            : Container(),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 20.0,
                            children: [
                              TaskContainer(
                                color: const Color.fromRGBO(255, 213, 6, 0.36),
                                imagePath: "assets/images/user.png",
                                title: "Personal",
                                count: yellowCount,
                              ),
                              TaskContainer(
                                color: const Color.fromRGBO(30, 209, 2, 0.36),
                                imagePath: "assets/images/briefcase.png",
                                title: "Work",
                                count: greenCount,
                              ),
                              TaskContainer(
                                color: const Color.fromRGBO(209, 2, 99, 0.36),
                                imagePath: "assets/images/presentation.png",
                                title: "Meeting",
                                count: purpleCount,
                              ),
                              TaskContainer(
                                color: const Color.fromRGBO(48, 68, 242, 0.36),
                                imagePath: "assets/images/study.png",
                                title: "Study",
                                count: blueCount,
                              ),
                              TaskContainer(
                                color: const Color.fromRGBO(242, 145, 48, 0.36),
                                imagePath: "assets/images/shopping.png",
                                title: "Shopping",
                                count: orangeCount,
                              ),
                            ],
                          ),
                        )),
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
