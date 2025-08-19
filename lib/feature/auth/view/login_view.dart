import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:bloc_mvvm_sudhanshu/config/validator.dart';
import 'package:bloc_mvvm_sudhanshu/feature/auth/view_model/auth_bloc.dart';
import 'package:bloc_mvvm_sudhanshu/feature/common_widgets/custom_toast.dart';
import 'package:bloc_mvvm_sudhanshu/routing/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Successful")),
              );
              toNamed(context, Routes.home);
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: bloc.emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: bloc.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButtonFormField<String>(
                      value: bloc.selectedRole,
                      decoration: const InputDecoration(
                        labelText: AppString.role,
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "vendor",
                          child: Text("Vendor"),
                        ),
                        DropdownMenuItem(
                          value: "customer",
                          child: Text("Customer"),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => bloc.selectedRole = value);
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                state is LoginLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          bool? isValid = Validator.instance.loginValidator(
                              email: bloc.emailController.text.trim(),
                              password: bloc.passwordController.text.trim());

                          if (isValid) {
                            context.read<AuthBloc>().add(LoginEvent());
                          } else {
                            toast(msg: Validator.instance.error);
                          }
                        },
                        child: const Text("Login"),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
