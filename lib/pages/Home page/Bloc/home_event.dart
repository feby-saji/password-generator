part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnChangeTextValue extends HomeEvent {
  String value;
  OnChangeTextValue({required this.value});
}

class LoadAllPassword extends HomeEvent {}

class AddPassword extends HomeEvent {
  PasswordModel password;
  AddPassword({required this.password});
}

class UpdatePassword extends HomeEvent {
  String newPassword;
  UpdatePassword({required this.newPassword});
}

class DeletePassword extends HomeEvent {
  PasswordModel password;
  DeletePassword({required this.password});
}
