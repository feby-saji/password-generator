import 'package:flutter/material.dart';
import 'package:password_manager/functions/copy_pass_show_snackbar.dart';
import 'package:password_manager/models/password_model.dart';

class PasswordItem extends StatelessWidget {
  final PasswordModel passwordModel;
  Function() onTap;

  PasswordItem({
    required this.passwordModel,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(
          passwordModel.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: GestureDetector(
          onTap:() => copyPassShowSnackBar(context, TextEditingController(text:passwordModel.password)),
          child: Icon(Icons.copy)),
        onTap: onTap,
      ),
    );
  }
}
