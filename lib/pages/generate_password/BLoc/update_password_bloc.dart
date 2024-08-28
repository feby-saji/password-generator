import 'package:bloc/bloc.dart';
import 'package:password_manager/hive_DB/db_functions.dart';
import 'package:password_manager/pages/generate_password/BLoc/update_password_state.dart';

import '../../../functions/generate_randam_pass.dart';

part 'update_password_event.dart';

class GeneratePasswordBloc
    extends Bloc<GeneratePasswordEvent, GeneratePasswordState> {
  GeneratePasswordBloc()
      : super(const GeneratePasswordState(password: '', length: 8)) {
    on<GeneratePassword>(_onGeneratePassword);
    on<PasswordLengthChanged>(_onPasswordLengthChanged);
    on<ToggleIncludeUppercase>(_onToggleIncludeUppercase);
    on<ToggleIncludeDigits>(_onToggleIncludeDigits);
    on<ToggleIncludeSpecialChars>(_onToggleIncludeSpecialChars);
    on<ToggleIncludeLowercase>(_onToggleIncludeLowercase);
    on<UpdatePasswordEvent>(_updatePasswordEvent);
    on<ClearError>(_clearError);
  }

  void _onGeneratePassword(
    GeneratePassword event,
    Emitter<GeneratePasswordState> emit,
  ) {
    try {
      String? password = generateRandomPassword(
        length: state.length.toInt(),
        includeUppercase: state.includeUppercase,
        includeLowercase: state.includeLowercase,
        includeDigits: state.includeDigits,
        includeSpecialChars: state.includeSpecialChars,
      );
      return emit(state.copyWith(password: password, error: ''));
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  _onPasswordLengthChanged(
      PasswordLengthChanged event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(length: event.length));
  }

  _onToggleIncludeUppercase(
      ToggleIncludeUppercase event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(includeUppercase: event.includeUpperCase));
  }

  _onToggleIncludeLowercase(
      ToggleIncludeLowercase event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(includeLowercase: event.includeLowerCase));
  }

  _onToggleIncludeDigits(
      ToggleIncludeDigits event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(includeDigits: event.includeDigits));
  }

  _onToggleIncludeSpecialChars(
      ToggleIncludeSpecialChars event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(includeSpecialChars: event.includeSpecialChars));
  }

  _updatePasswordEvent(
      UpdatePasswordEvent event, Emitter<GeneratePasswordState> emit) {
    HiveDb()
        .updatePassword(event.passWordKey, event.newPassword, event.newDate);
    return emit(state.copyWith(password: event.newPassword));
  }

  _clearError(ClearError event, Emitter<GeneratePasswordState> emit) {
    return emit(state.copyWith(error: ''));
  }
}
