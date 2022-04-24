import 'package:flutter/material.dart';
import 'package:todo_app_local/core/routes/app_routes.dart';
import 'package:todo_app_local/features/todo/presentation/widgets/initial_widget.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 180.0),
          child: Center(
            child: InitialWidget(),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 92.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.bottomNavigation);
                },
                child: Container(
                  height: 57.0,
                  width: 258.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color.fromRGBO(57, 168, 1, 1),
                          Color.fromRGBO(93, 230, 26, 1),
                        ]),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Rubik",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
