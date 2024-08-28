import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String text,
    {bool error = false}) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisSize:
          MainAxisSize.min, // Ensure the row doesn't expand beyond its content
      children: [
        Icon(
          error ? Icons.error_rounded : Icons.check_circle,
          color: error ? Colors.redAccent : Colors.greenAccent,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            maxLines: 2, // Allow up to 2 lines
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black87,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: 'OK',
      textColor: Colors.greenAccent,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
