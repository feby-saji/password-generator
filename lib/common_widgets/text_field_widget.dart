import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.searchIcon = false,
    this.optional = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool searchIcon;
  final bool optional;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: searchIcon == true ? const Icon(Icons.search) : null,
        errorStyle: const TextStyle(
          color: Colors.orange,
        ), // Customize the error text color
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ), // Customize the border color when there is an error
        ),
      ),
      validator: optional
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return 'cannot be empty';
              }
              return null;
            },
    );
  }
}
