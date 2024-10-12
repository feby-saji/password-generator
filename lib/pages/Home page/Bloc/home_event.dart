part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnChangeTextValue extends HomeEvent {
  final String value;
  OnChangeTextValue({required this.value});
}

class LoadAllPassword extends HomeEvent {}

class AddPassword extends HomeEvent {
  final PasswordModel password;
  AddPassword({required this.password});
}

class UpdatePassword extends HomeEvent {
  final String newPassword;
  UpdatePassword({required this.newPassword});
}

class DeletePassword extends HomeEvent {
  final PasswordModel password;
  DeletePassword({required this.password});
}
