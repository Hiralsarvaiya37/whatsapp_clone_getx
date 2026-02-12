import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/bloc/list_view_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/bloc/list_view_state.dart';

class ListViewBloc extends Bloc<ListViewEvent, ListViewState> {
  ListViewBloc() : super(ListViewState()) {
    on<ToggleIsOn>((event, emit) {
      emit(state.copyWith(isOn: event.value));
    });
    on<ToggleOption>((event, emit) {
      emit(state.copyWith(selectedOption: event.value));
    });
  }
}
