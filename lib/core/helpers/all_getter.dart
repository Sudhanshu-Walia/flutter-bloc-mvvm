import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/repository/auth_repository.dart';
import '../../feature/chat/repository/chat_repository.dart';
import '../../feature/home/repository/home_repository.dart';
import '../network/http_service.dart';
import '../network/network_info.dart';
import '../local_storage/local_storage.dart';

/// general getter

class Getters {
  Getters._();




  static LocalStorage get getLocalStorage => GetIt.I.get<LocalStorage>();

  static HttpService get getHttpService => GetIt.I.get<HttpService>();

  static NetworkInfo get networkInfo => GetIt.I.get<NetworkInfo>();





  static AuthRepository get authRepository => GetIt.I.get<AuthRepository>();
  static HomeRepository get homeRepository => GetIt.I.get<HomeRepository>();
  static ChatRepository get chatRepository => GetIt.I.get<ChatRepository>();
}
