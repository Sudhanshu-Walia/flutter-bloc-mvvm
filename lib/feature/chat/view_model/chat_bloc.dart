import 'dart:async';
import 'package:bloc_mvvm_sudhanshu/feature/chat/model/chat_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/helper.dart';
import '../../../core/helpers/all_getter.dart';
import '../../common_widgets/custom_toast.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<GetChatListEvent>(_onGetChatList);
    on<SendMessageEvent>(_onSendMessage);
  }

  final messageController = TextEditingController();

  List<ChatHistoryModel> chatHistory = [];
  FutureOr<void> _onGetChatList(
      GetChatListEvent event, Emitter<ChatState> emit) async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        return;
      }
      emit(GetChatListLoading());
      if (await Getters.networkInfo.isSlow) {
        toast(msg: "Your Internet connection is slow", isError: true);
      }

      final result = await Getters.chatRepository.getChatHistory(id: event.id);
      final state = result.fold((error) {
        return GetChatListFailed(error: error.message);
      }, (result) {
        chatHistory = result;
        return const GetChatListSuccess(message: '');
      });
      emit(state);
    } catch (e) {
      blocLog(
        msg: e.toString(),
        bloc: "ChatBloc",
      );
      emit(GetChatListFailed(error: e.toString()));
    }
  }

  FutureOr<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        return;
      }
      emit(SendMessageLoading());
      if (await Getters.networkInfo.isSlow) {
        toast(msg: "Your Internet connection is slow", isError: true);
      }

      final result = await Getters.chatRepository.sendMessage();
      final state = result.fold((error) {
        return SendMessageFailed(error: error.message);
      }, (result) {
        if (result != null) {
          chatHistory.add(result);
        }
        return const SendMessageSuccess(message: '');
      });
      emit(state);
    } catch (e) {
      blocLog(
        msg: e.toString(),
        bloc: "ChatBloc",
      );
      emit(SendMessageFailed(error: e.toString()));
    }
  }
}
