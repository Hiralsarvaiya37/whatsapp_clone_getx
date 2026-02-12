import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/utils/theme/bloc/theme_event.dart';
import 'package:whatsapp_clone_getx/utils/theme/bloc/theme_state.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/defulat_pallet.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(DefulatPallet())) {
    on<ChangeTheme>((event, emit) {
      emit(ThemeState(event.pallet));
    });
  }
}
