import 'package:flutter/material.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/initial.png'),
        const SizedBox(
          height: 116.0,
        ),
        const Text(
          "Reminders made simple",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO( 85, 78, 143,1),
            fontFamily: "Rubik",
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
