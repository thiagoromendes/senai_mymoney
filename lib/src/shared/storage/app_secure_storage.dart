import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';

class AppSecureStorage {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> addItem(Appkeys key, String value) async {
    await storage.write(key: key.toString(), value: value);
  }

  static Future<void> deleteItem(Appkeys key) async {
    await storage.delete(key: key.toString());
  }

  static Future<String?> readItem(Appkeys key) async {
    return await storage.read(key: key.toString());
  }
}
