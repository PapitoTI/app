import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Widget/ScheduleCustomTableCalendar/schedule_custom_table_calendar_widget.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CreateSchedulePage extends StatelessWidget {
  final logic = Get.put(CreateScheduleLogic());
  final itineraryLogic = Get.find<ItineraryLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (homeBaseLogic) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackButtonWidget(title: 'Criar agendamento'),
              ),
              Container(child: Expanded(child: ScheduleCustomTableCalendar()))
            ],
          ),
        ),
      );
    });
  }
}
