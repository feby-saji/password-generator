import 'package:bloc/bloc.dart';
import 'package:password_manager/functions/formatDate.dart';

class DateTimePasswordCubit extends Cubit<String> {
  DateTimePasswordCubit() : super(formattedDate(DateTime.now()));

  showFormattedDate(DateTime date) {
    emit(formattedDate(date));
  }
}
