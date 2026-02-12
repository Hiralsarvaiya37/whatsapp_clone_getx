import 'package:flutter_bloc/flutter_bloc.dart';
import 'privacy_event.dart';
import 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyBloc() : super(PrivacyState()) {
    on<SetLastSeen>((event, emit) {
      emit(state.copyWith(selectedLastSeen: event.value));
    });

    on<SetOnlineStatus>((event, emit) {
      emit(state.copyWith(selectedOnline: event.value));
    });

    on<ToggleIsOn>((event, emit) {
      emit(state.copyWith(isOn: event.value));
    });

    on<ToggleIsOn1>((event, emit) {
      emit(state.copyWith(isOn1: event.value));
    });

    on<ToggleIsOn2>((event, emit) {
      emit(state.copyWith(isOn2: event.value));
    });
    on<ToggleOption>((event, emit) {
      emit(state.copyWith(selectedOption: event.value));
    });
  }
}
