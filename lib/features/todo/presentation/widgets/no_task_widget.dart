import 'package:flutter/material.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/notask.png'),
            const SizedBox(
              height: 70.0,
            ),
            const Text(
              "No tasks",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(85, 78, 143, 1),
                fontFamily: "Rubik",
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
