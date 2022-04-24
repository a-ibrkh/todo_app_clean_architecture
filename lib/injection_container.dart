import 'package:get_it/get_it.dart';
import 'package:todo_app_local/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:todo_app_local/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_app_local/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/color_date_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => TodoBloc(repository: sl()));
  sl.registerFactory(() => ColorDateBloc());
  //repository
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(localDatasource: sl()));
  //datasource
  sl.registerLazySingleton<TodoLocalDatasource>(
      () => TodoLocalDatasourceImpl());
}
