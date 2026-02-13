import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  VideoPlayerController? videoController; 

  AccountBloc() : super(AccountState.initial()) {
    on<InitVideoEvent>(_initVideo);
    on<PlayPauseEvent>(_playPause);
    on<SelectOptionEvent>(_selectOption);
    on<ToggleNotificationEvent>(_toggleNotification);
    on<NavigateAccountOptionEvent>(_navigate);
    on<ResetNavigationEvent>(_resetNavigation);
    on<SubmitFeedbackEvent>(_submitFeedback); 
    on<ToggleAccountInformationEvent>(_toggleAccountInformation);
    on<ToggleChannelsActivityEvent>(_toggleChannelsActivity);
    on<ToggleCountryEvent>((event, emit) {
      emit(state.copyWith(selectedCountry: event.country));
    });
    on<DeleteAccountEvent>(_deleteAccount);
  }

  Future<void> _initVideo(
    InitVideoEvent event,
    Emitter<AccountState> emit,
  ) async {
    if (videoController != null) {
      return;
    }

    try {
      videoController = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://www.pexels.com/download/video/11836616/', 
        ),
      );

      await videoController!.initialize();
      emit(state.copyWith(isVideoInitialized: true));
    } catch (e) {
      emit(state.copyWith(isVideoInitialized: false));
    }
  }
   void _submitFeedback(
    SubmitFeedbackEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(feedback: event.isYes));
  }
  void _playPause(
    PlayPauseEvent event,
    Emitter<AccountState> emit,
  ) {
    final controller = videoController;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (controller.value.isPlaying) {
      controller.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      controller.play();
      emit(state.copyWith(isPlaying: true));
    }
  }

  void _toggleAccountInformation(
    ToggleAccountInformationEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(isAccountInfoOn: !state.isAccountInfoOn));
  }

  void _toggleChannelsActivity(
    ToggleChannelsActivityEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(isChannelsActivityOn: !state.isChannelsActivityOn));
  }

  void _selectOption(
    SelectOptionEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(selectedOption: event.index));
  }

  void _toggleNotification(
    ToggleNotificationEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(isNotificationOn: !state.isNotificationOn));
  }

 void _navigate(
  NavigateAccountOptionEvent event,
  Emitter<AccountState> emit,
) {
  emit(state.copyWith(navigateTo: event.option));
}

  void _resetNavigation(
    ResetNavigationEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(navigateTo: null));
  }

  Future<void> _deleteAccount(
    DeleteAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(isDeleting: true));

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(isDeleting: false));
    } catch (e) {
      emit(state.copyWith(
        isDeleting: false,
      ));
    }
  }

  @override
  Future<void> close() async {
    await videoController?.dispose();
    videoController = null;
    return super.close();
  }
}