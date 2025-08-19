import 'package:equatable/equatable.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

final class GetChatListLoading extends ChatState {
  @override
  List<Object> get props => [];
}
final class GetChatListSuccess extends ChatState {
  final String message;
  const GetChatListSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetChatListFailed extends ChatState {
  final String error;
  const GetChatListFailed({required this.error});
  @override
  List<Object> get props => [error];
}

final class SendMessageLoading extends ChatState {
  @override
  List<Object> get props => [];
}
final class SendMessageSuccess extends ChatState {
  final String message;
  const SendMessageSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class SendMessageFailed extends ChatState {
  final String error;
  const SendMessageFailed({required this.error});
  @override
  List<Object> get props => [error];
}
