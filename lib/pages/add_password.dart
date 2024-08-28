import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/common_widgets/text_field_widget.dart';
import 'package:password_manager/constants/helper_functions.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/pages/Home%20page/Bloc/home_bloc.dart';
import 'package:password_manager/pages/generate_password/generate_password.dart';

import '../constants/styles/sizes.dart';

final formKey = GlobalKey<FormState>();

TextEditingController _appNameController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class AddPasswordScreen extends StatelessWidget {
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: KSizes.bodyMarginSide,
            right: KSizes.bodyMarginSide,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                HelperFunc.verticalSizedBox(context, height: 0.2),
                //
                TextFieldWidget(
                  controller: _appNameController,
                  hintText: 'website / App Name',
                ),
                HelperFunc.verticalSizedBox(context, height: 0.08),

                TextFieldWidget(
                  controller: _userNameController,
                  hintText: 'Email / Username',
                  optional: true,
                ),
                HelperFunc.verticalSizedBox(context, height: 0.08),

                TextFieldWidget(
                  controller: _passwordController,
                  hintText: 'password',
                ),
                HelperFunc.verticalSizedBox(context, height: 0.1),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      HelperFunc.pushScreen(context, GeneratePasswordScreen());
                    },
                    child: const Text('Generate New password'),
                  ),
                ),
                HelperFunc.verticalSizedBox(context, height: 0.3),
                //
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('Form is valid');
                          PasswordModel password = PasswordModel(
                            password: _passwordController.text,
                            title: _appNameController.text,
                            usernameOREmail: _userNameController.text,
                            dateTime: DateTime.now(),
                          );
                          context
                              .read<HomeBloc>()
                              .add(AddPassword(password: password));

                          _passwordController.clear();
                          _appNameController.clear();
                          _userNameController.clear();

                          Navigator.pop(context);
                        } else {
                          print('Form is not valid');
                        }
                      },
                      child: const Text('Add Password'),
                    ),
                  ),
                ),
                HelperFunc.verticalSizedBox(
                  context,
                  height: KSizes.marginFromBottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
