part of 'color_date_bloc.dart';

abstract class ColorDateState extends Equatable {
  const ColorDateState();

  @override
  List<Object?> get props => [];
}

class ColorInitial extends ColorDateState {
  bool? isColorSelected;
  Color? selectedColor;
  DateTime? dateTime;
  ColorInitial({
     this.isColorSelected,
    this.selectedColor,
    this.dateTime,
  });

  @override
  List<Object?> get props => [isColorSelected, selectedColor, dateTime];
}
