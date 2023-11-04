import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.leadingIcon, required this.onTap});
  final String title;
  final Icon leadingIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: leadingIcon,
      title: Text(
        title,
        style: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.grey.shade700,
          fontSize: 12.sp,
          fontWeight: title == '2 Yetişkin' ? null : FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_outlined),
    );
  }
}
