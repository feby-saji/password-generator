import 'dart:math';

String? generateRandomPassword({
  required int length,
  required includeUppercase,
  required includeLowercase,
  required includeDigits,
  required includeSpecialChars,
}) {
  const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String digits = '0123456789';
  const String specialChars = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

  String chars = '';

  if (includeLowercase) chars += lowercaseChars;
  if (includeUppercase) chars += uppercaseChars;
  if (includeDigits) chars += digits;
  if (includeSpecialChars) chars += specialChars;

  if (chars.isEmpty) {
    throw 'Atleast one codition must be selected';
  }

  Random random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}
