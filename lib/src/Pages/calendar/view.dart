import 'package:app/src/Pages/pending_schedules/view.dart';
import 'package:app/src/Widget/CustomTableCalendar/custom_table_calendar_widget.dart';
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
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_today_rounded,
              color: Colors.white,
            ),
            onPressed: (() => {Get.to(() => PendingSchedulesPage())}),
          )
        ],
        title: Text('Agenda'),
      ),
      body: SafeArea(
          child: Column(
        children: [
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
