import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_local/features/todo/data/models/todo_model.dart';

class ReminderContainer extends StatelessWidget {
  ReminderContainer({Key? key, required this.todoModel}) : super(key: key);
  final TodoModel todoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 106.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.31),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 20.0),
                  child: Text(
                    "Today Reminder",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Rubik",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Text(
                    todoModel.todoTitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Rubik",
                        fontSize: 13.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Text(
                    DateFormat.jm().format(todoModel.time),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Rubik",
                        fontSize: 13.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
