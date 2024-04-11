import 'package:my_money/src/shared/helpers/date_helper.dart';
import 'package:my_money/src/shared/model/user_connect_model.dart';

class ExpenseSendModel {
  late String user;
  late String category;
  late String description;
  late double value;
  late DateTime registrationDate;

  ExpenseSendModel({
    required this.user,
    required this.category,
    required this.description,
    required this.value,
    required this.registrationDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    Map<String, dynamic> userConnect = UserConnectModel(userId: user).toJson();

    data["user"] = userConnect;
    data["category"] = category;
    data["description"] = description;
    data["value"] = value;
    data["registrationDate"] = DateHelper.getFormatYMDT(registrationDate);

    return data;
  }

  ExpenseSendModel.fromJson(Map<String, dynamic> json, String? userId) {
    user = userId!;
    category = json["category"];
    description = json["description"];
    value = json["value"].toDouble();
    registrationDate = json["registrationDateTime"];
  }
}
