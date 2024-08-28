import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/constants/helper_functions.dart';
import 'package:password_manager/pages/Home%20page/widget_functions/password_item.dart';
import 'package:password_manager/pages/add_password.dart';
import 'package:password_manager/pages/password_details.dart';

import '../../common_widgets/text_field_widget.dart';
import '../../constants/styles/sizes.dart';
import 'Bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    context.read<HomeBloc>().add(OnChangeTextValue(value: ''));

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: KSizes.bodyMarginTop,
          left: KSizes.bodyMarginSide,
          right: KSizes.bodyMarginSide,
        ),
        child: Column(
          children: [
            TextFieldWidget(
              controller: controller,
              hintText: 'search passwords...',
              searchIcon: true,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeInitial>(
                builder: (context, state) {
                  if (state.passwords.isEmpty) {
                    return const Center(child: Text('No passwords saved'));
                  } else {
                    return ListView.builder(
                        itemCount: state.passwords.length,
                        itemBuilder: (context, ind) {
                          return PasswordItem(
                            passwordModel: state.passwords[ind],
                            onTap: () {
                              HelperFunc.pushScreen(
                                  context,
                                  PasswordDetailsScreen(
                                    password: state.passwords[ind],
                                  ));
                            },
                          );
                        });
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HelperFunc.pushScreen(context, const AddPasswordScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
