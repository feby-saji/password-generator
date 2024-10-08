import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/constants/styles/colors.dart';

import '../../common_widgets/snackbar.dart';
import '../../constants/helper_functions.dart';
import '../../constants/styles/sizes.dart';
import '../../functions/copy_pass_show_snackbar.dart';
import 'BLoc/update_password_bloc.dart';
import 'BLoc/update_password_state.dart';

TextEditingController _controller = TextEditingController();

class GeneratePasswordScreen extends StatelessWidget {
  bool updatePassword;
  GeneratePasswordScreen({super.key, this.updatePassword = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.only(
          top: KSizes.bodyMarginTop,
          left: KSizes.bodyMarginSide,
          right: KSizes.bodyMarginSide,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              updatePassword ? 'UPDATE PASSWORD' : 'GENERATE NEW PASSWORD',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            BlocConsumer<GeneratePasswordBloc, GeneratePasswordState>(
              listener: (context, state) {
                if (_controller.text != state.password) {
                  _controller.text = state.password;
                }

                // Handle error snack bar
                if (state.error.isNotEmpty) {
                  showCustomSnackBar(context, state.error, error: true);
                  context.read<GeneratePasswordBloc>().add(ClearError());
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => updatePassword
                      ? updatePassAndCopy(context, _controller)
                      : copyPassShowSnackBar(context, _controller),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: HelperFunc.isDarkTheme(context)
                          ? Colors.grey[800]
                          : KColors.cardBck,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[600]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.password.isEmpty ? '' : state.password,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: HelperFunc.isDarkTheme(context)
                                      ? Colors.black87
                                      : Colors.white70,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          updatePassword ? Icons.save : Icons.copy,
                          color: KColors.iconColorPrimary,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'PASSWORD LENGTH',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            BlocBuilder<GeneratePasswordBloc, GeneratePasswordState>(
              builder: (context, state) {
                return Column(
                  children: [
                    buildSlider(state, context),
                    Text(
                      state.length
                          .round()
                          .toString(), // Set this to the appropriate value
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BlocBuilder<GeneratePasswordBloc, GeneratePasswordState>(
                builder: (context, state) {
                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2, // Adjust this ratio as needed
                    ),
                    children: [
                      _buildCheckboxTile(
                          context, 'UPPER CASE', state.includeUppercase, (val) {
                        context.read<GeneratePasswordBloc>().add(
                            ToggleIncludeUppercase(includeUpperCase: val!));
                      }),
                      _buildCheckboxTile(
                          context, 'LOWER CASE', state.includeLowercase, (val) {
                        context.read<GeneratePasswordBloc>().add(
                            ToggleIncludeLowercase(includeLowerCase: val!));
                      }),
                      _buildCheckboxTile(
                          context, 'SPECIAL CHARS', state.includeSpecialChars,
                          (val) {
                        context.read<GeneratePasswordBloc>().add(
                            ToggleIncludeSpecialChars(
                                includeSpecialChars: val!));
                      }),
                      _buildCheckboxTile(context, 'DIGITS', state.includeDigits,
                          (val) {
                        context
                            .read<GeneratePasswordBloc>()
                            .add(ToggleIncludeDigits(includeDigits: val!));
                      }),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<GeneratePasswordBloc>().add(GeneratePassword());
                },
                child: Text(
                  'GENERATE',
                  style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }

  Slider buildSlider(GeneratePasswordState state, BuildContext context) {
    return Slider(
      value: state.length,
      min: 4,
      max: 50,
      divisions: 42,
      activeColor:
          HelperFunc.isDarkTheme(context) ? Colors.white : KColors.cardBck,
      inactiveColor:
          HelperFunc.isDarkTheme(context) ? Colors.grey : Colors.white,
      onChanged: (value) {
        context.read<GeneratePasswordBloc>().add(PasswordLengthChanged(value));
      },
    );
  }

  Widget _buildCheckboxTile(BuildContext context, String label, bool value,
      ValueChanged<bool?> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.cardBck,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: CheckboxListTile(
          title: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: value,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          tileColor: Colors.transparent,
          visualDensity: VisualDensity.compact, // Reduce vertical density
          activeColor: Colors.white,
          checkColor: Colors.black,
        ),
      ),
    );
  }
}
