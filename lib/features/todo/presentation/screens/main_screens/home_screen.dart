import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/no_task_widget.dart';

import '../../bloc/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  return Container();
                }
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ),
        ),
      ],
    );
  }
}
