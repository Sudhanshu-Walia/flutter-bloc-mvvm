import 'dart:convert';
import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:bloc_mvvm_sudhanshu/core/helpers/all_getter.dart';
import 'package:bloc_mvvm_sudhanshu/core/network/http_service.dart';
import 'package:bloc_mvvm_sudhanshu/feature/home/model/participant_model.dart';
import 'package:dio/dio.dart';
import '../../../core/error/failure.dart';
import '../../../core/utils/dartz/either.dart';

class HomeRepository {
  Future<Either<Failure, List<ParticipantModel>>> getChatList() async {
    try {
      var dio = Dio();
      final id = Getters.getLocalStorage.getId();
      var response = await dio.request(
        '${ApiConstants.getChatList}$id',
        options: Options(
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        printLog(json.encode(response.data));

        final model = (response.data as List)
            .map((e) => ParticipantModel.fromJson(e))
            .toList();


        return Right(model);
      } else {
        return Left(ServerFailure(message: response.statusMessage ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
