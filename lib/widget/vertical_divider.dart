import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const Stack(
        alignment: Alignment.topCenter,
        children: [
          VerticalDivider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
