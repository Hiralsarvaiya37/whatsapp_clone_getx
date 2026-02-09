abstract class ChatEvent {}

class InitChat extends ChatEvent {
  final String myId;
  final String otherId;
  final String otherName;

  InitChat({
    required this.myId,
    required this.otherId,
    required this.otherName,
  });
}

class TypingEvent extends ChatEvent {
  final bool isTyping;
  TypingEvent(this.isTyping);
}
