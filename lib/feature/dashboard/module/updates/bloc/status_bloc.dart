import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusState.initial()) {
    on<InitStatus>((event, emit) {
      emit(
        StatusState(
          list: List.from(event.list),
          currentIndex: 0,
          isPaused: false,
        ),
      );
    });

    on<ChangeStatus>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<PauseStatus>((event, emit) {
      emit(state.copyWith(isPaused: true));
    });

    on<ResumeStatus>((event, emit) {
      emit(state.copyWith(isPaused: false));
    });

    on<NextStatus>((event, emit) {
      if (state.currentIndex < state.list.length - 1) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });

    on<PreviousStatus>((event, emit) {
      if (state.currentIndex > 0) {
        emit(state.copyWith(currentIndex: state.currentIndex - 1));
      }
    });
  }
}
