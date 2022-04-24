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

import 'features/todo/presentation/bloc/bloc/color_date_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<TodoBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ColorDateBloc>(),
        ),
      ],
      child: MaterialApp(
        title: "To Do App",
        routes: AppScreens.screens,
        home: const InitialScreen(),
      ),
    );
  }
}
