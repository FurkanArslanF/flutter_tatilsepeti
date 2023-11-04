import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/global.dart';
import 'package:flutter_tatilsepeti/widget/global/eleveted_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class DatePickerWidget extends ConsumerStatefulWidget {
  const DatePickerWidget({super.key});

  @override
  ConsumerState<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends ConsumerState<DatePickerWidget> {
  List dateValue = [];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  String _getValueText(List<DateTime?> values) {
    values = values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    if (values.isNotEmpty) {
      final startDate = values[0].toString();
      final endDate = values.length > 1 ? values[1].toString() : values[0].toString();
      if (startDate == endDate) {
        return "";
      }
      var pickFirstDate = DateTime.parse(startDate);
      var pickLastDate = DateTime.parse(endDate);
      dateValue = [pickFirstDate, pickLastDate, pickLastDate.difference(pickFirstDate).inDays];
      return "${GlobalConst.dateTimeTextFormat.format(pickFirstDate)} - ${GlobalConst.dateTimeTextFormat.format(pickLastDate)} (${pickLastDate.difference(pickFirstDate).inDays} Gece) ";
    }
    return "null";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.w),
        child: Padding(
          padding: context.padding.onlyTopLow,
          child: AppBar(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey.shade100,
            leadingWidth: 0,
            title: Text(
              'Tarih Seçin',
              style: context.general.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp, color: GlobalColors.colorPrimary),
            ),
            leading: const Center(),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: context.padding.onlyTopLow,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                controlsHeight: 8.w,
                calendarViewMode: DatePickerMode.day,
                calendarType: CalendarDatePicker2Type.range,
                dayBorderRadius: const BorderRadius.horizontal(),
                rangeBidirectional: true,
                selectedDayHighlightColor: GlobalColors.colorPrimary,
                firstDayOfWeek: 1,
                centerAlignModePicker: true,
                disableModePicker: true,
                dayBuilder: ({required date, textStyle, decoration, isSelected, isDisabled, isToday}) {
                  if (isSelected == true) {
                    return Container(
                      decoration: BoxDecoration(
                        color: GlobalColors.colorPrimary,
                        borderRadius: const BorderRadius.horizontal(),
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: context.general.textTheme.bodyLarge?.copyWith(fontSize: 9.sp, color: Colors.white),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
              value: _rangeDatePickerValueWithDefaultValue,
              onValueChanged: (value) {
                setState(() {
                  _rangeDatePickerValueWithDefaultValue = value;
                });
              },
            ),
          ),
          Text(
            _getValueText(_rangeDatePickerValueWithDefaultValue),
            style: context.general.textTheme.bodyMedium?.copyWith(color: GlobalColors.colorPrimary),
          ),
          context.sized.emptySizedHeightBoxLow,
          SizedBox(
            width: 95.w,
            height: 12.w,
            child: ElevetedButtonWidget(
              text: "Seçili Tarihlerde Ara",
              onPressed: () {
                debugPrint(dateValue.toString());
                Navigator.pop(context, dateValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
