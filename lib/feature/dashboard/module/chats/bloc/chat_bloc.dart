import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
      : super(ChatState(
          chatId: "",
          myUserId: "",
          otherUserName: "",
          isShow: false,
          messageController: TextEditingController(),
        )) {
    on<InitChat>((event, emit) {
      final id = event.myId.compareTo(event.otherId) < 0
          ? "${event.myId}_${event.otherId}"
          : "${event.otherId}_${event.myId}";

      emit(state.copyWith(
        chatId: id,
        myUserId: event.myId,
        otherUserName: event.otherName,
      ));
    });

    on<TypingEvent>((event, emit) {
      emit(state.copyWith(isShow: event.isTyping));
    });
  }
}
