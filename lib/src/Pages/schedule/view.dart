import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/description_widget.dart';
import 'package:app/src/Widget/itinerary_info_widget.dart';
import 'package:app/src/Widget/itinerary_page_title_widget.dart';
import 'package:app/src/Widget/timeline_widget/view.dart';
import 'package:app/src/Widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final logic = Get.put(ScheduleLogic());

  final state = Get.find<ScheduleLogic>().state;

  var _schedule = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackButtonWidget(title: 'Roteiro agendado'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItineraryPageTitleWidget(
                    title: _schedule.itinerary.name,
                    category: _schedule.itinerary.category,
                    duration: durationToHours(calculateTotalDurationToMinutes(
                        _schedule.itinerary.spotDuration)),
                  ),
                ),
                if (home.session is GuideServerConnectionInterface)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: UserCardWidget(
                      imageUrl: home.session
                          .getImage(_schedule.touristModel.imageUrl),
                      name: _schedule.touristModel.name,
                    ),
                  ),
                if (home.session is TouristServerConnectionInterface)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: UserCardWidget(
                      imageUrl: _schedule.itinerary.guideModel.imageUrl,
                      name: _schedule.itinerary.guideModel.name,
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: DescriptionWidget(
                              description: _schedule.itinerary.description)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: ItineraryInfoWidget(
                    price: _schedule.itinerary.price.toStringAsFixed(2),
                    duration: durationToHours(
                      calculateTotalDurationToMinutes(
                          _schedule.itinerary.spotDuration),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Palette.cinzaTransparente),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (DateTime.now()
                                          .toUtc()
                                          .isBefore(_schedule.date))
                                        Text(
                                          'Roteiro já agendado!',
                                          style: TextStyle(fontSize: 26),
                                        ),
                                      if (DateTime.now()
                                          .toUtc()
                                          .isAfter(_schedule.date))
                                        Text(
                                          'Roteiro concluído!',
                                          style: TextStyle(fontSize: 26),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.blue,
                                          size: 32,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    _schedule.date.day.toString() +
                                        ' ' +
                                        DateFormat.MMMM().format(
                                            DateTime(0, _schedule.date.month)) +
                                        ' ' +
                                        _schedule.date.year.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _schedule.date.hour.toString() +
                                          ':' +
                                          DateFormat('mm').format(DateTime(
                                              0, _schedule.date.minute)) +
                                          ' às',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ))),
                                          onPressed: null,
                                          child: Text('Chat')),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ))),
                                          onPressed: null,
                                          child: Text('Cancelar'))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TimelineWidgetPage(),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
