import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/global.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

AppBar tabBarPreferredSize(BuildContext context) {
  return AppBar(
    backgroundColor: GlobalColors.colorPrimary,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(15.w),
      child: Column(
        children: [
          Image.asset(
            "assets/logo.png",
            // height: 10.w,
            color: Colors.white,
            width: 35.w,
            fit: BoxFit.contain,
          ),
          TabBar(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused) ? null : Colors.transparent;
              },
            ),
            padding: context.padding.onlyTopLow,
            splashFactory: NoSplash.splashFactory,
            labelPadding: EdgeInsets.only(bottom: 0.5.h),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Column(
                children: [
                  Icon(Icons.apartment_outlined, size: 8.w),
                  Text(
                    "Otel",
                    style:
                        context.general.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.train_outlined, size: 8.w),
                  Text(
                    "Tur",
                    style:
                        context.general.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.car_rental_outlined, size: 8.w),
                  Text(
                    "Araç",
                    style:
                        context.general.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.airplanemode_active_outlined, size: 8.w),
                  Text(
                    "Uçak",
                    style:
                        context.general.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
