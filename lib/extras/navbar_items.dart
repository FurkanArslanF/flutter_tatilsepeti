import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/screen/error.dart';
import 'package:flutter_tatilsepeti/screen/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarModel {
  NavbarModel._();
  static final instance = NavbarModel._();

  List<Widget> pages = [
    const HomeScreen(),
    const ErrorScreen(),
    const ErrorScreen(),
    const ErrorScreen(),
    const ErrorScreen(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black.withOpacity(0.5),
        icon: const Icon(
          Icons.home,
        ),
        title: 'Ana sayfa',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black.withOpacity(0.5),
        icon: const Icon(
          Icons.favorite,
        ),
        title: 'Favoriler',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black.withOpacity(0.5),
        icon: const Icon(
          Icons.calendar_today,
        ),
        title: 'Rezervasyon',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black.withOpacity(0.5),
        icon: const Icon(
          Icons.person,
        ),
        title: 'Hesabım',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black.withOpacity(0.5),
        icon: const Icon(
          Icons.menu,
        ),
        title: 'Menü',
      ),
    ];
  }
}
