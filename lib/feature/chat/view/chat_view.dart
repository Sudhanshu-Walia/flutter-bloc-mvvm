import 'dart:ffi';

import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../chat/view_model/chat_event.dart';
import '../../chat/view_model/chat_state.dart';
import '../view_model/chat_bloc.dart';

class ChatView extends StatelessWidget {
  final String id;
  const ChatView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc()..add(GetChatListEvent(id: id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat Screen"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ChatBloc, ChatState>(
            listener: (context, state) {
              if (state is GetChatListSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("GetChat List Successful")),
                );
              } else if (state is GetChatListFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              final chatBloc = context.read<ChatBloc>();
              return (state is GetChatListLoading)
                  ? const Center(
                      child: SizedBox(
                          height: 70,
                          width: 70,
                          child: CupertinoActivityIndicator()),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        (chatBloc.chatHistory.isNotEmpty)
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: chatBloc.chatHistory.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final data = chatBloc.chatHistory[index];
                                      return Align(
                                        alignment: Alignment.centerRight,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Text(
                                              data.content,
                                              softWrap: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : SizedBox(),
                        yHeight(10),
                        if (state is GetChatListSuccess)
                          TextField(
                            controller: chatBloc.messageController,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      chatBloc.add(SendMessageEvent());
                                    },
                                    child: const Icon(Icons.send)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.black))),
                          )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
