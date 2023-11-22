import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  Future loginDelay(){
    return Future.delayed(const Duration(seconds: 2));
  }
  
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginButtonPressedState());
      await loginDelay();
      emit(LoginFinishedState());
    });
  }
}
