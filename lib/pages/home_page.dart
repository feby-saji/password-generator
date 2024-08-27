import 'package:flutter/material.dart';
import 'package:password_manager/common_widgets/text_field_widget.dart';

import '../constants/styles/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: KSizes.bodyMarginTop,
          left: KSizes.bodyMarginside,
          right: KSizes.bodyMarginside,
        ),
        child: Column(
          children: [
            TextFieldWidget(
              controller: controller,
              onChange: (value) {},
            ),
            const SizedBox(height: 16),
            PasswordItem(label: 'Facebook'),
            PasswordItem(label: 'Card'),
            PasswordItem(label: 'Amazon'),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding a new password
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PasswordItem extends StatelessWidget {
  final String label;

  const PasswordItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Text(label),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () {
            // Handle copying the password
          },
        ),
      ],
    );
  }
}
