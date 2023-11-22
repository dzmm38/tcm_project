part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginButtonPressedState extends LoginState{}

final class LoginFinishedState extends LoginState {}
