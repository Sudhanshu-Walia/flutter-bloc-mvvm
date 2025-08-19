import 'dart:convert';
import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:bloc_mvvm_sudhanshu/core/network/http_service.dart';
import 'package:dio/dio.dart';
import '../../../core/error/failure.dart';
import '../../../core/utils/dartz/either.dart';
import '../model/chat_history_model.dart';

class ChatRepository {
  Future<Either<Failure, List<ChatHistoryModel>>> getChatHistory(
      {required String id}) async {
    try {
      var dio = Dio();

      var response = await dio.request(
        '${ApiConstants.getChatHistory}$id',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        printLog(json.encode(response.data));

        final model = (response.data as List)
            .map((e) => ChatHistoryModel.fromJson(e))
            .toList();

        return Right(model);
      } else {
        return Left(ServerFailure(message: response.statusMessage ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ChatHistoryModel?>> sendMessage() async {
    try {
      var headers = {
        'Content-Type': 'application/json'
      };
      var dio = Dio();
      var data = json.encode({
        "chatId": "679bbd688c09df5b75cd1070",
        "senderId": "673d80bc2330e08c323f4393",
        "content": "Hello!!!",
        "messageType": "text",
        "fileUrl": ""
      });
      var response = await dio.request(
        ApiConstants.sendMessage,
        data: data,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      if (response.statusCode == 201) {
        printLog(json.encode(response.data));

        final model = ChatHistoryModel.fromJson(response.data);

        return Right(model);
      } else {
        return Left(ServerFailure(message: response.statusMessage ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
