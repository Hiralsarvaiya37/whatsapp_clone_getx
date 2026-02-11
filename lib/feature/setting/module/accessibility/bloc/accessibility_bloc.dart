import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/bloc/accessibility_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/bloc/accessibility_state.dart';

class AccessibilityBloc
    extends Bloc<AccessibilityEvent, AccessibilityState> {

  AccessibilityBloc() : super(AccessibilityState.initial()) {
    on<ToggleOn1>((event, emit) {
      emit(state.copyWith(isOn1: !state.isOn1));
    });

    on<ToggleOn2>((event, emit) {
      emit(state.copyWith(isOn2: !state.isOn2));
    });

    on<ToggleOn3>((event, emit) {
      emit(state.copyWith(isOn3: !state.isOn3));
    });
  }
}
