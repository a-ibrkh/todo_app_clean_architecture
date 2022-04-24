import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/color_date_bloc.dart';
import 'package:todo_app_local/features/todo/presentation/bloc/bloc/todo_bloc.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  final List<Widget> categories = const [
    Categories(
      category: "Personal",
      color: Color.fromRGBO(255, 213, 6, 1),
    ),
    Categories(
      category: "Work",
      color: Color.fromRGBO(30, 209, 2, 1),
    ),
    Categories(
      category: "Meeting",
      color: Color.fromRGBO(209, 2, 99, 1),
    ),
    Categories(
      category: "Study",
      color: Color.fromRGBO(48, 68, 242, 1),
    ),
    Categories(
      category: "Shopping",
      color: Color.fromRGBO(242, 145, 48, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories,
        ));
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.category,
    required this.color,
  }) : super(key: key);
  final String category;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ColorDateBloc>(context).add(
              ColorDateSelected(isColorSelected: true, selectedColor: color));
        },
        child: BlocBuilder<ColorDateBloc, ColorDateState>(
          builder: (context, state) {
            if (state is ColorInitial) {
              return Container(
                height: 30.0,
                child: Row(
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: color,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      category,
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
