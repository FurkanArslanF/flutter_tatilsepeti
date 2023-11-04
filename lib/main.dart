import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/extras/navbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tatil Sepeti',
          home: NavbarWrapper(),
        );
      },
    );
  }
}
