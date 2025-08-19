import 'package:equatable/equatable.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

final class GetChatListEvent extends ChatEvent {
  final String id;
  const GetChatListEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

final class SendMessageEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}
