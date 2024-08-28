import 'package:flutter/material.dart';

void showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onPressed();
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
