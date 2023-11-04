import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/extras/tabbar_preferred_size.dart';
import 'package:flutter_tatilsepeti/screen/home/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: tabBarPreferredSize(context),
        body: TabBarView(
          children: [
            const HotelScreen(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
