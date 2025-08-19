import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/helper.dart';
import '../../../core/helpers/all_getter.dart';
import '../../common_widgets/custom_toast.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  final emailController = TextEditingController(text: 'swaroop.vass@gmail.com');
  final passwordController = TextEditingController(text: '@Tyrion99');
  String selectedRole = "vendor"; // default

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        return;
      }
      emit(LoginLoading());
      if (await Getters.networkInfo.isSlow) {
        toast(msg: "Your Internet connection is slow", isError: true);
      }
      Map<String, dynamic> body = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "role": "vendor",
      };
      final result = await Getters.authRepository.login(
        body: body,
      );
      final state = result.fold((error) {
        return LoginFailed(error: error.message);
      }, (result) {
        return const LoginSuccess(message: '');
      });
      emit(state);
    } catch (e) {
      blocLog(
        msg: e.toString(),
        bloc: "AuthBloc",
      );
      emit(LoginFailed(error: e.toString()));
    }
  }
}
