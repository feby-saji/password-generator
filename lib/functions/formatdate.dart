import 'package:intl/intl.dart';

formattedDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}
