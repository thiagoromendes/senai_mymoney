import 'package:my_money/src/shared/helpers/date_helper.dart';

class ExpenseModel {
  late String category;
  late String description;
  late double value;
  late String registrationDate;
  late DateTime registrationDateTime;

  ExpenseModel({
    required this.category,
    required this.description,
    required this.value,
    required this.registrationDate,
    required this.registrationDateTime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["category"] = category;
    data["description"] = description;
    data["value"] = value;
    data["registrationDate"] = registrationDate;
    data["registrationDateTime"] = registrationDateTime;

    return data;
  }

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    category = json["category"];
    description = json["description"];
    value = json["value"].toDouble();
    registrationDate =
        DateHelper.getFormatDMY(DateTime.parse(json["registrationDate"]));
  }
}
