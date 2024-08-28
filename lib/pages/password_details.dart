import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/constants/helper_functions.dart';
import 'package:password_manager/constants/styles/colors.dart';
import 'package:password_manager/functions/copy_pass_show_snackbar.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/pages/Home%20page/Bloc/home_bloc.dart';
import 'package:password_manager/pages/generate_password/BLoc/update_password_bloc.dart';
import 'package:password_manager/pages/generate_password/generate_password.dart';

import '../common_widgets/show_dialog.dart';
import '../constants/styles/sizes.dart';
import '../functions/formatdate.dart';
import 'generate_password/BLoc/update_password_state.dart';

class PasswordDetailsScreen extends StatelessWidget {
  PasswordModel password;
  PasswordDetailsScreen({
    super.key,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              password.title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),

            HelperFunc.verticalSizedBox(
              context,
              height: 0.2,
            ), //
            FieldTileWidget(
              icon: Icons.calendar_today,
              text: formattedDate(password.dateTime),
            ),
            HelperFunc.verticalSizedBox(context, height: 0.1),

            FieldTileWidget(
              icon: Icons.person,
              text: password.usernameOREmail,
            ),
            HelperFunc.verticalSizedBox(context, height: 0.1),

            BlocBuilder<GeneratePasswordBloc, GeneratePasswordState>(
              builder: (context, state) {
                return FieldTileWidget(
                  icon: Icons.lock,
                  text: password.password,
                  copyIcon: true,
                );
              },
            ),
            const Spacer(), // bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showConfirmationDialog(
                        context: context,
                        title: 'Confirm Deletion',
                        content:
                            'Are you sure you want to delete this item? This action cannot be undone.',
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(DeletePassword(password: password));
                          Navigator.pop(context);
                        });
                  },
                  child: const Text('DELETE'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final updatedPassword = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GeneratePasswordScreen(updatePassword: true),
                        ));
                    //
                    if (updatedPassword != null) {
                      password.password = updatedPassword;
                      // Dispatch the event to update the password
                      context
                          .read<GeneratePasswordBloc>()
                          .add(UpdatePasswordEvent(
                            newPassword: updatedPassword,
                            passWordKey: password.key,
                            newDate: DateTime.now(),
                          ));
                    }
                  },
                  child: const Text('UPDATE PASSWORD'),
                ),
              ],
            ),
            HelperFunc.verticalSizedBox(
              context,
              height: KSizes.marginFromBottom,
            ),
          ],
        ),
      ),
    );
  }
}

class FieldTileWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool copyIcon;

  FieldTileWidget({
    super.key,
    required this.icon,
    required this.text,
    this.copyIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 01,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10), // Space between icon and text
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines:
                  1, // Keeps text on a single line with ellipsis if too long
            ),
          ),
          if (copyIcon)
            GestureDetector(
              onTap: () => copyShowSnackBar(context, text),
              child: Icon(Icons.copy, color: KColors.iconColorPrimary),
            ),
        ],
      ),
    );
  }
}
