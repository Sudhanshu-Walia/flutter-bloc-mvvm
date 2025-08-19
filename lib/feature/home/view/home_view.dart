import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:bloc_mvvm_sudhanshu/feature/Home/view_model/Home_bloc.dart';
import 'package:bloc_mvvm_sudhanshu/feature/Home/view_model/home_state.dart';
import 'package:bloc_mvvm_sudhanshu/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/view_model/home_event.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<HomeBloc>();

    return BlocProvider(
      create: (_) => HomeBloc()..add(GetListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        //===//
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is GetListSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("GetList Successful")),
                );
              } else if (state is GetListFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              final homeBloc = context.read<HomeBloc>();
              return (state is GetListLoading)
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
                  (homeBloc.participantsList.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: homeBloc.participantsList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = homeBloc.participantsList[index];
                                return InkWell(
                                  onTap: () {
                                    toNamed(context, Routes.chat,
                                        args: {'id': data.id});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.participants?[0].name ?? "Unknown"}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${data.lastMessage?.content ?? "No messages yet."}",
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
