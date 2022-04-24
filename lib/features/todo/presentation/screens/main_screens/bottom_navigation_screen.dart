import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/screens/main_screens/home_screen.dart';
import 'package:todo_app_local/features/todo/presentation/screens/main_screens/task_screen.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/categories_row.dart';

import '../../bloc/bloc/color_date_bloc.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const TaskScreen(),
  ];
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 106,
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
              ),
              Positioned(
                top: -105,
                left: -80,
                child: Container(
                  height: 211.0,
                  width: 211.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.17),
                    borderRadius: BorderRadius.circular(106.0),
                  ),
                ),
              ),
              Positioned(
                top: -18.0,
                right: -18.0,
                child: Container(
                  height: 93.0,
                  width: 93.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.17),
                    borderRadius: BorderRadius.circular(47.0),
                  ),
                ),
              ),
              const Positioned(
                left: 20.0,
                top: 65.0,
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(95, 135, 231, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_outlined,
            ),
            label: 'Task',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int i) {
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: SizedBox(
        height: 64.0,
        width: 64.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              _showAddTodo();
            },
            backgroundColor: const Color.fromRGBO(248, 87, 195, 1),
            child: const Icon(
              Icons.add_rounded,
              size: 48.0,
            ),
          ),
        ),
      ),
    );
  }

  void _showAddTodo() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Stack(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 32.0,
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 120.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(180, 50),
                          topRight: Radius.elliptical(180, 50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: BlocBuilder<ColorDateBloc, ColorDateState>(
                          builder: (context, state) {
                            if (state is ColorInitial) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 44.0,
                                  ),
                                  const Text(
                                    "Add new task",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Rubik",
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  TextField(
                                    controller: taskController,
                                    enabled: state.isColorSelected,
                                    decoration: InputDecoration(
                                        hintText: state.isColorSelected ?? false
                                            ? "Add task"
                                            : "Select color"),
                                    cursorColor:
                                        const Color.fromARGB(255, 53, 36, 56),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 2.0,
                                    width: double.infinity,
                                    color: state.selectedColor,
                                  ),
                                  const CategoriesRow(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 2.0,
                                    width: double.infinity,
                                    color: state.selectedColor,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Choose date",
                                      style: TextStyle(
                                          fontFamily: "Rubik", fontSize: 13.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat.yMMMMd().format(
                                                state.dateTime ??
                                                    DateTime.now()) +
                                            " " +
                                            DateFormat.jm().format(
                                              state.dateTime ?? DateTime.now(),
                                            ),
                                        style: const TextStyle(
                                            fontFamily: "Rubik",
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          DatePicker.showDateTimePicker(
                                            context,
                                            minTime: DateTime.now(),
                                            onConfirm: (time) {
                                              BlocProvider.of<ColorDateBloc>(
                                                      context)
                                                  .add(
                                                ColorDateSelected(
                                                    dateTime: time,
                                                    selectedColor:
                                                        state.selectedColor,
                                                    isColorSelected:
                                                        state.isColorSelected),
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.arrow_drop_down),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: SafeArea(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom +
                                                  10.0,
                                              left: 10.0,
                                              right: 10.0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (taskController
                                                    .text.isNotEmpty) {
                                                  BlocProvider.of<TodoBloc>(
                                                          context)
                                                      .add(
                                                    AddTodo(
                                                      todoModel: TodoModel(
                                                        todoTitle:
                                                            taskController.text,
                                                        color: state
                                                            .selectedColor!
                                                            .value,
                                                        isDone: false,
                                                        isReminder: false,
                                                        time: state.dateTime ??
                                                            DateTime.now(),
                                                      ),
                                                    ),
                                                  );
                                                  taskController.clear();
                                                  BlocProvider.of<
                                                              ColorDateBloc>(
                                                          context)
                                                      .add(
                                                          const ColorDateSelected(
                                                              isColorSelected:
                                                                  false));
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              child: Container(
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.0),
                                                  child: Text(
                                                    "Add task",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Rubik",
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.centerRight,
                                                      end: Alignment.centerLeft,
                                                      colors: [
                                                        Color.fromRGBO(
                                                            95, 135, 231, 1),
                                                        Color.fromRGBO(
                                                            126, 182, 255, 1)
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                height: 53.0,
                                                width: double.infinity,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - 32,
                  child: SizedBox(
                    height: 64.0,
                    width: 64.0,
                    child: FittedBox(
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<ColorDateBloc>(context).add(
                              const ColorDateSelected(isColorSelected: false));
                          taskController.clear();
                        },
                        backgroundColor: const Color.fromRGBO(248, 87, 195, 1),
                        child: const Icon(
                          Icons.cancel_outlined,
                          size: 48.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]);
        });
  }
}
