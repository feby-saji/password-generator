import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/models/password_model.dart';

class HiveDb {
  String passWordBoxId = 'PASSWORD_BOX';
  Box? passWordsBox;

  init() async {
    passWordsBox = await Hive.openBox<PasswordModel>(passWordBoxId);
  }

  savePassWords(PasswordModel password) async {
    passWordsBox = await Hive.openBox<PasswordModel>(passWordBoxId);
    String key = DateTime.now().millisecondsSinceEpoch.toString();

    password.key = key;
    await passWordsBox?.put(key, password);
    print('password saved is ${password.title}');
  }

  getPassWords() async {
    passWordsBox = await Hive.openBox<PasswordModel>(passWordBoxId);
    print(passWordsBox?.values.length);
    return passWordsBox?.values.toList();
  }

  updatePassword(String passwordKey, String newPass, DateTime date) async {
    passWordsBox = await Hive.openBox<PasswordModel>(passWordBoxId);
    PasswordModel? pass = await passWordsBox?.get(passwordKey);
    if (pass != null) {
      pass.password = newPass;
      pass.dateTime = date;
      await passWordsBox?.put(passwordKey, pass);
    }
  }

  Future<void> deletePassword(dynamic password) async {
    passWordsBox = await Hive.openBox<PasswordModel>(passWordBoxId);
    passWordsBox?.delete(password.key);
  }
}
