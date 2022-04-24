import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer(
      {Key? key,
      required this.color,
      required this.imagePath,
      required this.title,
      required this.count})
      : super(key: key);
  final Color color;
  final String imagePath;
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 210.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: const Offset(3.0, 2.0)),
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(33.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 104, 104, 104),
              fontFamily: "Rubik",
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            count.toString() + " tasks",
            style: TextStyle(fontFamily: "Rubik"),
          ),
        ],
      ),
    );
  }
}
