import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.controller, required this.hintText, required this.prefixIcon});
  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: const Icon(Icons.chevron_right_outlined),
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Divider(
          indent: 12.w,
        )
      ],
    );
  }
}
