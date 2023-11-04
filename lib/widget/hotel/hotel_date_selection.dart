import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/widget/date_display.dart';
import 'package:flutter_tatilsepeti/widget/date_picker.dart';
import 'package:flutter_tatilsepeti/widget/vertical_divider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class HotelDateSelectionWidget extends ConsumerStatefulWidget {
  const HotelDateSelectionWidget({super.key});

  @override
  ConsumerState<HotelDateSelectionWidget> createState() => _HotelDateSelectionWidgetState();
}

class _HotelDateSelectionWidgetState extends ConsumerState<HotelDateSelectionWidget> {
  List selectedDate = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_month_outlined),
            context.sized.emptySizedWidthBoxLow3x,
            Expanded(
              child: DateDisplayWidget(
                selectedDate: selectedDate,
                text: "Giriş Tarihi",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: (0.15).w,
                        child: const DatePickerWidget(),
                      );
                    },
                  ).then((value) {
                    setState(() {
                      selectedDate = value;
                    });
                  });
                },
              ),
            ),
            Column(
              children: [
                VerticalDividerWidget(
                  width: 15.w,
                  height: 6.w,
                ),
                Container(
                  height: 5.w,
                  width: 13.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      selectedDate.isNotEmpty ? "${selectedDate[2]} Gece" : "5 Gece",
                      style: context.general.textTheme.bodySmall,
                    ),
                  ),
                ),
                VerticalDividerWidget(
                  width: 15.w,
                  height: 6.w,
                ),
              ],
            ),
            Expanded(
              child: DateDisplayWidget(
                selectedDate: selectedDate,
                text: "Çıkış Tarihi",
                outTime: true,
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: (0.15).w,
                        child: const DatePickerWidget(),
                      );
                    },
                  ).then((value) {
                    setState(() {
                      selectedDate = value;
                    });
                  });
                },
              ),
            ),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
      ],
    );
  }
}
