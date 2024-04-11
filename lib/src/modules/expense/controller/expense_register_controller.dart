import 'package:mobx/mobx.dart';
import 'package:my_money/src/modules/expense/service/expense_register_service.dart';
import 'package:my_money/src/shared/helpers/date_helper.dart';
part 'expense_register_controller.g.dart';

class ExpenseRegisterController = _ExpenseRegisterController
    with _$ExpenseRegisterController;

abstract class _ExpenseRegisterController with Store {
  ExpenseRegisterService service = ExpenseRegisterService();

  @observable
  String categoryValue = '';

  @observable
  DateTime? expenseDateTime = null;

  @observable
  String expenseDateFormat = '';

  @action
  void setCategoryValue(String value) {
    categoryValue = value;
  }

  @action
  void setExpensaDate(DateTime? dateTime) {
    expenseDateTime = dateTime;
    expenseDateFormat = DateHelper.getFormatDMY(dateTime!);
  }

  Future<void> sendData({
    required String value,
    required String description,
    required String category,
    required String registrationDate,
  }) async {
    await service.sendData(
      value:
          double.parse(value.replaceAll(",", ".").substring(3, value.length)),
      description: description,
      category: category,
      registrationDate: registrationDate,
      registrationDateTime: expenseDateTime!,
    );
  }
}
