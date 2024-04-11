import 'package:my_money/src/modules/expense/model/expense_model.dart';
import 'package:my_money/src/modules/expense/model/expense_send_model.dart';
import 'package:my_money/src/modules/expense/repositories/expense_register_repository.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_storage.dart';

class ExpenseRegisterService {
  ExpenseRegisterRepository repository = ExpenseRegisterRepository();

  Future<void> sendData({
    required double value,
    required String description,
    required String category,
    required String registrationDate,
    required DateTime registrationDateTime,
  }) async {
    String? userId = await AppSecureStorage.readItem(Appkeys.user_id);

    final data = ExpenseModel(
        value: value,
        description: description,
        category: category,
        registrationDate: registrationDate,
        registrationDateTime: registrationDateTime);

    final sendData = ExpenseSendModel.fromJson(data.toJson(), userId);

    await repository.sendData(sendData);
  }
}
