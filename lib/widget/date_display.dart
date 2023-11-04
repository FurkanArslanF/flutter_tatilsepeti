import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class DateDisplayWidget extends ConsumerStatefulWidget {
  const DateDisplayWidget(
      {super.key, required this.text, this.outTime = false, required this.onTap, required this.selectedDate});
  final String text;
  final bool outTime;
  final void Function() onTap;
  final List selectedDate;

  @override
  ConsumerState<DateDisplayWidget> createState() => _DateDisplayWidgetState();
}

class _DateDisplayWidgetState extends ConsumerState<DateDisplayWidget> {
  var dateTime = DateTime.now().toLocal();
  bool hasIncreased = false;
  List monthList = ["Oca", "Şub", "Mar", "Nis", "May", "Haz", "Tem", "Ağu", "Eyl", "Eki", "Kas", "Ara"];
  List dayList = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];

  void outTime() {
    if (widget.outTime) {
      if (!hasIncreased) {
        dateTime = dateTime.add(const Duration(days: 5));
        hasIncreased = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedDate.isNotEmpty) {
      dateTime = widget.selectedDate[0];
    }
    if (widget.outTime && widget.selectedDate.isNotEmpty) {
      widget.selectedDate.isEmpty ? dateTime = DateTime.now().toLocal() : dateTime = widget.selectedDate[1];
    }
    outTime();
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.text, style: context.general.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat('dd').format(dateTime),
                style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 34.sp),
              ),
              context.sized.emptySizedWidthBoxLow,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${monthList[dateTime.month - 1]}",
                    style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  Text(
                    "${dayList[dateTime.weekday - 1]}",
                    style: context.general.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
