
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.onChanged,
    this.icon,
    this.onPressed,
    this.controller,
  });
  final String hint;
  final void Function(String)? onChanged;
  final IconData? icon;
  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: onPressed != null,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
    );
  }
}
