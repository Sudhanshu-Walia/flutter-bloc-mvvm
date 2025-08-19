import 'package:bloc_mvvm_sudhanshu/config/helper.dart';
import 'package:bloc_mvvm_sudhanshu/core/helpers/all_getter.dart';
import 'package:bloc_mvvm_sudhanshu/core/network/http_service.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/dartz/either.dart';
import '../model/user_model.dart';

class AuthRepository {
  Future<Either<Failure, UserModel?>> login({
    required Map<String, dynamic> body,
  }) async {
    try {
      final dataResponse = await Getters.getHttpService.request<UserModel>(
        body: body,
        url: ApiConstants.login,
        fromJson: (json) => UserModel.fromJson(json),
      );
      printLog("data res[onse ]:-> ${dataResponse.encrypted}");

      if (dataResponse.encrypted == true && dataResponse.data != null) {
        final model = dataResponse.data!;
        await Getters.getLocalStorage.saveId("${model.user?.sId}");

        return Right(model);
      } else {
        return Left(ServerFailure(message: dataResponse.errorMessage ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
