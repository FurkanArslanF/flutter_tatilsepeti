import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/global.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ElevetedButtonWidget extends StatelessWidget {
  const ElevetedButtonWidget({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: GlobalColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: context.general.textTheme.bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.white),
      ),
    );
  }
}
