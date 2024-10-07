import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:password_manager/hive_DB/db_functions.dart';
import 'package:password_manager/pages/generate_password/BLoc/update_password_state.dart';

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
    String length = state.length.toString();
    String includeUppercase = state.includeUppercase.toString();
    String includeDigits = state.includeDigits.toString();
    String includeSpecialChars = state.includeSpecialChars.toString();

    Uri uri = Uri.parse(
        'https://passwordgenerator-feby-sajis-projects.vercel.app/generatepassword?length=$length&includeUppercase=$includeUppercase&includeDigits=$includeDigits&includeSpecialChars=$includeSpecialChars');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print('status code : 200');
        return emit(state.copyWith(password: response.body, error: ''));
      } else if (response.statusCode == 400) {
        print('status code : 400');
        return emit(state.copyWith(error: response.body.toString()));
      } else {
        print('something went wrong');
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
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
