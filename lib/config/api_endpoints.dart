part of '../core/network/http_service.dart';

abstract final class ApiConstants {
  static const String _baseUrl = "http://45.129.87.38:6065/";
  static const String login = "${_baseUrl}user/login";
  static const String getChatList = "${_baseUrl}chats/user-chats/";
  static const String getChatHistory = "${_baseUrl}messages/get-messagesformobile/";
  static const String sendMessage = "${_baseUrl}messages/sendMessage";
}
