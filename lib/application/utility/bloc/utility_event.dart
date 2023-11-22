part of 'utility_bloc.dart';

@immutable
sealed class UtilityEvent {}


//! Event wenn die 'Remember me' Checkbox gedrückt wurde
class RememberMePressEvent extends UtilityEvent {
  final bool isChecked;
  RememberMePressEvent(this.isChecked);
}
class RememberMeAbfrage extends UtilityEvent {}

class NavigationBarButtonPressed extends UtilityEvent {
  final int index;
  NavigationBarButtonPressed(this.index);
}
