import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/pending_schedules/view.dart';
import 'package:app/src/Widget/CustomTableCalendar/custom_table_calendar_widget.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final logic = Get.put(CalendarLogic());
  final state = Get.find<CalendarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonWidget(title: 'Agenda'),
                Container(
                  decoration: BoxDecoration(
                      color: Palette.cinzaTransparente,
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                    ),
                    onPressed: (() => {Get.to(() => PendingSchedulesPage())}),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: CustomTableCalendar()),
        ],
      )),
    );
  }

  @override
  void dispose() {
    Get.delete<CalendarLogic>();
    super.dispose();
  }
}
