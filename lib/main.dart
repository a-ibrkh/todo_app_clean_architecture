import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todo_app_local/injection_container.dart' as di;
import 'package:todo_app_local/core/keys/app_keys.dart';
import 'package:todo_app_local/core/routes/app_screens.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';
import 'package:todo_app_local/features/todo/presentation/screens/initial_screen.dart';
import 'package:todo_app_local/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(AppKeys.todos);

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoBloc>(),
      child: MaterialApp(
        title: "To Do App",
        routes: AppScreens.screens,
        home: const InitialScreen(),
      ),
    );
  }
}
