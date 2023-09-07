import 'dart:convert';
import 'package:my_money/src/shared/model/user_model.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_storage.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    Map<String, dynamic> userJson = {};

    String? user = await AppSecureStorage.readItem(Appkeys.user);

    String goalValue =
        await AppSecureStorage.readItem(Appkeys.goal_value) ?? "0";

    if (user != null) userJson.addAll(jsonDecode(user));

    userJson["limitValue"] = goalValue;

    UserModel userData = UserModel.fromJson(userJson);

    return userData;
  }
}
