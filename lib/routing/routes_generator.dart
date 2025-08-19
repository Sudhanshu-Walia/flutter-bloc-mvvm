import 'package:bloc_mvvm_sudhanshu/feature/auth/view/login_view.dart';
import 'package:bloc_mvvm_sudhanshu/feature/auth/view_model/auth_bloc.dart';
import 'package:bloc_mvvm_sudhanshu/feature/home/view/home_view.dart';
import 'package:bloc_mvvm_sudhanshu/feature/home/view_model/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../feature/chat/view/chat_view.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print('Current Screen: ${settings.name}');
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const LoginView(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.chat:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => ChatView(id: args['id']),
        );
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}
