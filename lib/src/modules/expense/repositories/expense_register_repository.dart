import 'package:dio/dio.dart';
import 'package:my_money/src/http/app_dio.dart';
import 'package:my_money/src/modules/expense/model/expense_send_model.dart';

class ExpenseRegisterRepository {
  String baseURL = "http://192.168.31.96:3099/expense";

  Future<Response<Map<String, dynamic>>> sendData(
      ExpenseSendModel expenseData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return clientHTTP.post('$baseURL/create', data: expenseData.toJson());
  }
}
