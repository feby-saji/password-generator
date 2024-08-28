import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../common_widgets/snackbar.dart';

copyPassShowSnackBar(BuildContext context, TextEditingController controller) {
  if (controller.text.isNotEmpty) {
    Clipboard.setData(ClipboardData(text: controller.text));
    showCustomSnackBar(context, 'Password copied to clipboard');
  } else {
    showCustomSnackBar(
      context,
      'generate password to copy to clipboard',
      error: true,
    );
  }
}

updatePassAndCopy(BuildContext context, TextEditingController controller) {
  if (controller.text.isNotEmpty) {
    Clipboard.setData(ClipboardData(text: controller.text));
    showCustomSnackBar(context, 'Password copied to clipboard');
    Navigator.pop(context, controller.text);
  } else {
    showCustomSnackBar(
      context,
      'generate password to copy to clipboard',
      error: true,
    );
  }
}

copyShowSnackBar(BuildContext context, String data) {
  Clipboard.setData(ClipboardData(text: data));
  showCustomSnackBar(context, 'Password copied to clipboard');
}
