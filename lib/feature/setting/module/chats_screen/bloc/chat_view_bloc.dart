import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_view_event.dart';
import 'chat_view_state.dart';

class ChatViewBloc extends Bloc<ChatViewEvent, ChatViewState> {
  ChatViewBloc() : super(ChatViewState.initial()) {
    
    on<ToggleOn1>((event, emit) {
      emit(state.copyWith(isOn1: !state.isOn1));
    });

    on<ToggleOn2>((event, emit) {
      emit(state.copyWith(isOn2: !state.isOn2));
    });

    on<ToggleArchived>((event, emit) {
      emit(state.copyWith(isArchived: !state.isArchived));
    });

    on<ToggleDeleteMedia>((event, emit) {
      emit(state.copyWith(deleteMedia: !state.deleteMedia));
    });

    on<ChangeDeleteOption>((event, emit) {
      emit(state.copyWith(selectedDeleteOption: event.option));
    });

    on<ChangeGoogleAccount>((event, emit) {
      emit(state.copyWith(
        selectedGoogleAccount: event.account,
      ));
    });

    on<ChangeBackupFrequency>((event, emit) {
      emit(state.copyWith(
        backupFrequency: event.frequency,
      ));
    });
  }
}
