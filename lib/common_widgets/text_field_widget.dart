import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.onChange,
  });

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Search passwords...',
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: onChange,
    );
  }
}
