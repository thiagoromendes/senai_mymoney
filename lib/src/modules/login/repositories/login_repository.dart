import 'package:dio/dio.dart';
import 'package:my_money/src/http/app_dio.dart';
import 'package:my_money/src/modules/login/model/login_model.dart';

class LoginRepository {
  String baseURL = "http://192.168.31.96:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(LoginModel loginData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: false);

    return clientHTTP.post(baseURL, data: loginData.toJson());
  }
}
