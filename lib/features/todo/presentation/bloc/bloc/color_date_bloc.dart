import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_date_event.dart';
part 'color_date_state.dart';

class ColorDateBloc extends Bloc<ColorDateEvent, ColorDateState> {
  ColorDateBloc() : super(ColorInitial(isColorSelected: false)) {
    on<ColorDateEvent>((event, emit) {});
    on<ColorDateSelected>(
      (event, emit) {
        emit(
          ColorInitial(
              isColorSelected: event.isColorSelected ?? false,
              selectedColor: event.selectedColor ?? Colors.transparent,
              dateTime: event.dateTime ?? DateTime.now()),
        );
      },
    );
  }
}
