import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  String todoTitle;
  Color color;
  bool isDone;
  bool isReminder;
  DateTime time;

  TodoModel(
      {@HiveField(0) required this.todoTitle,
      @HiveField(1) required this.color,
      @HiveField(2) required this.isDone,
      @HiveField(3) required this.isReminder,
      @HiveField(4) required this.time});

  Map<int, dynamic> toMap() {
    return {
      0: todoTitle,
      1: color.value,
      2: isDone,
      3: isReminder,
      4: time.millisecondsSinceEpoch,
    };
  }

  factory TodoModel.fromMap(Map<int, dynamic> map) {
    return TodoModel(
      todoTitle: map[0] ?? '',
      color: Color(map[1]),
      isDone: map[2] ?? false,
      isReminder: map[3] ?? false,
      time: DateTime.fromMillisecondsSinceEpoch(map[4]),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.todoTitle == todoTitle &&
        other.color == color &&
        other.isDone == isDone &&
        other.isReminder == isReminder &&
        other.time == time;
  }

  @override
  int get hashCode {
    return todoTitle.hashCode ^
        color.hashCode ^
        isDone.hashCode ^
        isReminder.hashCode ^
        time.hashCode;
  }

  TodoModel copyWith({
    String? todoTitle,
    Color? color,
    bool? isDone,
    bool? isReminder,
    DateTime? time,
  }) {
    return TodoModel(
      todoTitle: todoTitle ?? this.todoTitle,
      color: color ?? this.color,
      isDone: isDone ?? this.isDone,
      isReminder: isReminder ?? this.isReminder,
      time: time ?? this.time,
    );
  }
}
