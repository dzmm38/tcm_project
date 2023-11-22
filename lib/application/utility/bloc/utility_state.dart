part of 'utility_bloc.dart';

@immutable
sealed class UtilityState {}


//! For Remember Me Usecase
final class UtilityInitial extends UtilityState {}

final class RememberMePressedState extends UtilityState{
  final bool isChecked;
  RememberMePressedState({required this.isChecked});
}
//! Navigation Bar
final class NavigationBarButtonSwitched extends UtilityState{
  final int index;
  NavigationBarButtonSwitched({required this.index});
}