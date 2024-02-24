
import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import '../../../models/calendar_item.dart';
import '../../../models/data.dart';

class ListCalendarData extends StatelessWidget {
  final List<CalendarData> calendarData;

  const ListCalendarData({Key? key, required this.calendarData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: calendarData
          .asMap()
          .entries
          .map(
            (data) => Padding(
              padding: EdgeInsets.only(
                  bottom:
                      data.key != calendarData.length - 1 ? kDefaultPadding : 0),
              child: CalendarItem(
                calendarItemData: data.value,
              ),
            ),
          )
          .toList(),
    );
  }
}
