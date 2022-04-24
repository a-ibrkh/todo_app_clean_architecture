part of 'color_date_bloc.dart';

abstract class ColorDateEvent extends Equatable {
  const ColorDateEvent();

  @override
  List<Object?> get props => [];
}

class ColorDateSelected extends ColorDateEvent {
  final bool? isColorSelected;
  final Color? selectedColor;
  final DateTime? dateTime;
  const ColorDateSelected({
     this.isColorSelected,
    this.selectedColor,
    this.dateTime,
  });

  @override
  List<Object?> get props => [isColorSelected, selectedColor, dateTime];
}
