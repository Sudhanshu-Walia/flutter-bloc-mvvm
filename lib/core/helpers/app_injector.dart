import 'dart:async';
import 'package:bloc_mvvm_sudhanshu/feature/auth/repository/auth_repository.dart';
import 'package:bloc_mvvm_sudhanshu/feature/auth/view_model/auth_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../config/helper.dart';
import '../../feature/chat/repository/chat_repository.dart';
import '../../feature/chat/view_model/chat_bloc.dart';
import '../../feature/home/repository/home_repository.dart' show HomeRepository;
import '../../feature/home/view_model/home_bloc.dart';
import '../local_storage/local_storage.dart';
import '../network/http_service.dart';
import '../network/interceptor.dart';
import '../network/network_info.dart';

typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await Hive.initFlutter(AppString.localDirectory);
    await GetIt.I.allReady();

    final storage = await HiveStorageImp.init();

    // Core services
    GetIt.I.registerLazySingleton<LocalStorage>(() => storage);
    GetIt.I.registerLazySingleton<Injector>(() => Injector());
    GetIt.I.registerLazySingleton<Connectivity>(() => Connectivity());
    GetIt.I.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImplementation(GetIt.I<Connectivity>()));
    GetIt.I.registerLazySingleton<HttpService>(() => HttpService());

    GetIt.I.registerLazySingleton<AuthRepository>(
      () => AuthRepository(),
    );

    GetIt.I.registerFactory<AuthBloc>(
      () => AuthBloc(),
    );



    GetIt.I.registerLazySingleton<HomeRepository>(
          () => HomeRepository(),
    );

    GetIt.I.registerFactory<HomeBloc>(
          () => HomeBloc(),
    );


    GetIt.I.registerLazySingleton<ChatRepository>(
          () => ChatRepository(),
    );

    GetIt.I.registerFactory<ChatBloc>(
          () => ChatBloc(),
    );
  }
}
