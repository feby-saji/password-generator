import 'package:hive/hive.dart';

part 'password_model.g.dart';

@HiveType(typeId: 1)
class PasswordModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String usernameOREmail;
  @HiveField(2)
  String password;

  PasswordModel({
    required this.password,
    required this.title,
    required this.usernameOREmail,
  });
}
