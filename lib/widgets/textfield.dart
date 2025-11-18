import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.currentFocus,
    this.nextFocus,
    this.labelText,
    this.hintText,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onEditingComplete: () {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        label: Text(labelText ?? ""),
        labelStyle: TextStyle(color: Colors.black.withValues()),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.5)),
      ),
    );
  }
}
