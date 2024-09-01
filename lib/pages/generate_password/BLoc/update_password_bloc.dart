import 'package:bloc/bloc.dart';
import 'package:password_manager/hive_DB/db_functions.dart';
import 'package:password_manager/pages/generate_password/BLoc/update_password_state.dart';
import 'package:http/http.dart' as http;

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
  ) async {
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

    // // nodejs
    // Uri uri = Uri.parse(
    //     'https://passwordgenerator-feby-sajis-projects.vercel.app/generatepassword?length=12&includeUppercase=true&includeDigits=true&includeSpecialChars=true');

    // Uri uri = Uri.parse(
    //     'http://192.168.46.25:3000/generatepassword?length=${state.length}&includeUppercase=${state.includeUppercase}&includeLowercase=${state.includeLowercase}&includeDigits=${state.includeDigits}&includeSpecialChars=${state.includeSpecialChars}');

    // try {
    //   final response = await http.get(uri);

    //   if (response.statusCode == 200) {
    //     print('status code : 200');
    //     return emit(state.copyWith(password: response.body, error: ''));
    //   } else if (response.statusCode == 400) {
    //     print('status code : 400');
    //     return emit(state.copyWith(error: response.body.toString()));
    //   } else {
    //     print('something went wrong');
    //     print(response.body);
    //   }
    // } catch (e) {
    //   print('Error: $e');
    //   return emit(state.copyWith(error: e.toString()));
    // }
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
