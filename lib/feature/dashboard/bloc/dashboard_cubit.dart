import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/bloc/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  String getAppBarName(int index) {
    return index == 0
        ? "Whatsapp"
        : index == 1
        ? "Updates"
        : index == 2
        ? "Communities"
        : "Calls";
  }
}
