import 'package:flutter_bloc/flutter_bloc.dart';
import 'update_event.dart';
import 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateState.initial()) {
    on<AddImageEvent>((event, emit) {
      final newList = [
        ...state.statusList,
        StatusItem(file: event.file, type: StatusType.image),
      ];
      emit(state.copyWith(statusList: newList));
    });

    on<AddVideoEvent>((event, emit) {
      final newList = [
        ...state.statusList,
        StatusItem(file: event.file, type: StatusType.video),
      ];
      emit(state.copyWith(statusList: newList));
    });

    on<ToggleArrowEvent>((event, emit) {
      emit(state.copyWith(isArrowDown: !state.isArrowDown));
    });

    on<ToggleDownEvent>((event, emit) {
      emit(state.copyWith(isDown: !state.isDown));
    });
  }
}
