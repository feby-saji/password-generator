part of 'update_password_bloc.dart';

sealed class GeneratePasswordEvent {
  const GeneratePasswordEvent();
}

class GeneratePassword extends GeneratePasswordEvent {}

class PasswordLengthChanged extends GeneratePasswordEvent {
  final double length;

  const PasswordLengthChanged(this.length);
}

class ToggleIncludeUppercase extends GeneratePasswordEvent {
  bool includeUpperCase;
  ToggleIncludeUppercase({required this.includeUpperCase});
}

class ToggleIncludeLowercase extends GeneratePasswordEvent {
  bool includeLowerCase;
  ToggleIncludeLowercase({required this.includeLowerCase});
}

class ToggleIncludeDigits extends GeneratePasswordEvent {
  bool includeDigits;
  ToggleIncludeDigits({required this.includeDigits});
}

class ToggleIncludeSpecialChars extends GeneratePasswordEvent {
  bool includeSpecialChars;
  ToggleIncludeSpecialChars({required this.includeSpecialChars});
}

class ClearError extends GeneratePasswordEvent {}

class UpdatePasswordEvent extends GeneratePasswordEvent {
  String passWordKey;
  String newPassword;
  DateTime newDate;
  UpdatePasswordEvent({
    required this.newPassword,
    required this.passWordKey,
    required this.newDate,
  });
}
