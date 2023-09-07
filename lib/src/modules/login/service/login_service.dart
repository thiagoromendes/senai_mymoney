import 'package:dio/dio.dart';
import 'package:my_money/src/modules/login/model/login_model.dart';
import 'package:my_money/src/modules/login/repositories/login_repository.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_storage.dart';

class LoginService {
  LoginRepository repository = LoginRepository();

  Future<Map<dynamic, dynamic>> sendData({
    required String username,
    required String password,
  }) async {
    try {
      LoginModel loginData = LoginModel(
        username: username,
        password: password,
      );

      await persistLocalData(
        await repository.sendData(loginData),
      );

      return {"success": true};
    } on DioError catch (exception) {
      return {"exception": sendException(exception)};
    }
  }

  Future<void> persistLocalData(Response<Map<String, dynamic>> response) async {
    Map<String, dynamic>? result = response.data;

    if (result != null) {
      String token = result['access_token'];
      Map<String, dynamic> userData = result['additional_information'];
      String userId = userData['id'];

      AppSecureStorage.addItem(Appkeys.auth_token, token);
      AppSecureStorage.addItem(Appkeys.user, userData.toString());
      AppSecureStorage.addItem(Appkeys.user_id, userId);
    }
  }

  int sendException(Object error) {
    final DioError errorResult = error as DioError;
    return errorResult.response!.data['statusCode'];
  }
}
