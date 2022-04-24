import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';

class CategoriesRow extends StatefulWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  @override
  State<CategoriesRow> createState() => _CategoriesRowState();
}

class _CategoriesRowState extends State<CategoriesRow> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Categories(
            category: "Personal",
            color: Colors.yellow,
            onPressed: () {},
          ),
          Categories(
            category: "Work",
            color: Colors.green,
            onPressed: () {},
          ),
          Categories(
            category: "Meeting",
            color: Color.fromRGBO(209, 2, 99, 1),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories(
      {Key? key,
      required this.category,
      required this.color,
      required this.onPressed})
      : super(key: key);
  final String category;
  final Color color;
  final VoidCallback? onPressed;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: 30.0,
          // decoration: BoxDecoration(color: ),
          child: Row(
            children: [
              Container(
                height: 10.0,
                width: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: widget.color,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                widget.category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
