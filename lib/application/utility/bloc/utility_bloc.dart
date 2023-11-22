import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tcm_project/domain/usecases/remember_me_usecase.dart';

part 'utility_event.dart';
part 'utility_state.dart';

class UtilityBloc extends Bloc<UtilityEvent, UtilityState> {  

  final RememberMeUseCase usecase = RememberMeUseCase();

  UtilityBloc() : super(UtilityInitial()) {

    on<NavigationBarButtonPressed>((event, emit) {
      emit(NavigationBarButtonSwitched(index: event.index));
    });

    on<RememberMePressEvent>((event, emit) async {
      bool isChecked = event.isChecked;
      if (isChecked) {
        usecase.setRemember(isChecked);
      }else{
        usecase.setRemember(false);
      }
      emit(RememberMePressedState(isChecked: isChecked));
    });
  }
}
