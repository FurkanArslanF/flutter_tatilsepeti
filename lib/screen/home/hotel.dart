import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/global.dart';
import 'package:flutter_tatilsepeti/widget/global/eleveted_button.dart';
import 'package:flutter_tatilsepeti/widget/global/list_tile.dart';
import 'package:flutter_tatilsepeti/widget/global/slider.dart';
import 'package:flutter_tatilsepeti/widget/hotel/hotel_date_selection.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 80.w,
              child: Padding(
                padding: context.padding.onlyLeftLow + context.padding.onlyRightLow,
                child: Column(
                  children: [
                    ListTileWidget(
                        leadingIcon: const Icon(Icons.search), title: 'Bölge,otel veya kampanya seçiniz', onTap: () {}),
                    Divider(indent: 10.w),
                    const HotelDateSelectionWidget(),
                    Divider(indent: 10.w),
                    ListTileWidget(leadingIcon: const Icon(Icons.person), title: '2 Yetişkin', onTap: () {}),
                    Divider(indent: 10.w),
                    context.sized.emptySizedHeightBoxLow,
                    SizedBox(
                        width: 100.w, height: 12.w, child: ElevetedButtonWidget(text: "Otel Ara", onPressed: () {})),
                  ],
                ),
              ),
            ),
            context.sized.emptySizedHeightBoxLow3x,
            Padding(
              padding: context.padding.onlyLeftLow + context.padding.onlyRightLow + context.padding.onlyBottomHigh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kampanyalar",
                    style: context.general.textTheme.bodyLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: GlobalColors.colorPrimary),
                  ),
                  const SliderWidget(),
                  context.sized.emptySizedHeightBoxLow3x,
                  Text(
                    "Öne Çıkan Oteller",
                    style: context.general.textTheme.bodyLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: GlobalColors.colorPrimary),
                  ),
                  const SliderWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
