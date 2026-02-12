import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/bloc/help_and_feedbach_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/bloc/help_and_feedback_event.dart';

class HelpAndFeedbackBloc
    extends Bloc<HelpAndFeedbackEvent, HelpAndFeedbackState> {

  HelpAndFeedbackBloc()
      : super(HelpAndFeedbackState(isShow: true, hasText: false)) {

    on<ToggleShow>((event, emit) {
      emit(state.copyWith(isShow: event.value));
    });

    on<SetHasText>((event, emit) {
      emit(state.copyWith(hasText: event.value));
    });
  }
}
