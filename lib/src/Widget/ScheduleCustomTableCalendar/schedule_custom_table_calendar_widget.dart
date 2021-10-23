import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/payment/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../orion_button_widget.dart';

class ScheduleCustomTableCalendar extends StatefulWidget {
  const ScheduleCustomTableCalendar({Key? key}) : super(key: key);

  @override
  _ScheduleCustomTableCalendarState createState() =>
      _ScheduleCustomTableCalendarState();
}

class _ScheduleCustomTableCalendarState
    extends State<ScheduleCustomTableCalendar> {
  late final ValueNotifier<List<ScheduleModel>> _selectedEvents;
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _firstDay = DateTime.utc(2021, 01, 01);
  DateTime _lastDay = DateTime.utc(2021, 12, 31);
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  var _selectedTime;
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();
  var weekdaysItinerary;

  String calculateSessionEnd(String start) {
    var endDuration = TimeOfDay.fromDateTime(DateTime.parse('0000-00-00 $start')
        .add(Duration(
            minutes: calculateTotalDurationToMinutes(
                itineraryLogic.itinerary.spotDuration))));
    return endDuration.format(context);
  }

  // final kEvents = LinkedHashMap(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // )..addAll(eventSource);

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<ScheduleModel> _getEventsForDay(DateTime date) {
    var schedules = homeBaseLogic.schedules;
    var dayScheduleList = schedules
        .where((item) =>
            (item.date.day.toString() +
                item.date.month.toString() +
                item.date.year.toString()) ==
            (date.day.toString() +
                date.month.toString() +
                date.year.toString()))
        .toList();
    return dayScheduleList ?? [];
  }

  List<ScheduleModel> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  bool disabledDays(DateTime day) {
    if (weekdaysItinerary[day.weekday] == false ||
        day.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return false;
    } else {
      return true;
    }
  }

  bool checkSessionAvailability(
      List<dynamic> listScheduleModel, DateTime checkDate) {
    var datesList = [];
    for (var scheduleDate in listScheduleModel) {
      datesList.add(scheduleDate.date);
    }
    if (datesList.contains(checkDate) ||
        checkDate.isBefore(DateTime.now().add(Duration(days: 1)))) {
      return true;
    } else {
      return false;
    }
  }

  // if (checkSchedule !=
  // snapshotList[index].date &&
  // checkSchedule
  //     .isAfter(DateTime.now()))

  @override
  Widget build(BuildContext context) {
    _selectedTime = itineraryLogic.itinerary.sessionsList;
    weekdaysItinerary = itineraryLogic.itinerary.weekdays;
    weekdaysItinerary.add(itineraryLogic.itinerary.weekdays[0]);
    return Column(
      children: [
        Center(
          child: Container(
            width: 350,
            child: FutureBuilder(
              future: homeBaseLogic.session.getSchedules(),
              builder: (context, snapshot) {
                return TableCalendar<ScheduleModel>(
                  firstDay: _firstDay,
                  lastDay: _lastDay,
                  focusedDay: _focusedDay,
                  enabledDayPredicate: (day) => disabledDays(day),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  eventLoader: _getEventsForDay,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerMargin: EdgeInsets.all(8),
                      titleTextStyle: TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Palette.cinzaTransparente,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment(
                                -1.467097520828247, -0.3287612795829773),
                            end: Alignment(
                                0.3287612795829773, -0.44422397017478943),
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.4399999976158142),
                              Color.fromRGBO(255, 255, 255, 1)
                            ]),
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )),
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(color: Palette.cinzaClaro),
                    disabledDecoration:
                        BoxDecoration(color: Palette.cinzaTransparente),
                    rowDecoration:
                        BoxDecoration(color: Palette.cinzaTransparente),
                    holidayDecoration:
                        BoxDecoration(color: Palette.cinzaTransparente),
                    defaultTextStyle: TextStyle(color: Colors.white),
                    markersMaxCount: 0,
                    markerDecoration: BoxDecoration(
                        color: Palette.branco,
                        borderRadius: BorderRadius.circular(10)),
                    outsideDaysVisible: false,
                  ),
                  onDaySelected: _onDaySelected,
                  onRangeSelected: _onRangeSelected,
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<ScheduleModel>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Palette.cinzaTransparente,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sessões disponíveis',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        GetBuilder<HomeBaseLogic>(builder: (homeBaseLogic) {
                          return GetBuilder<ItineraryLogic>(
                              builder: (itineraryLogic) {
                            return FutureBuilder(
                              future: homeBaseLogic.session.getSchedules(),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: itineraryLogic
                                        .itinerary.sessionsList.length,
                                    itemBuilder: (ctx, index) {
                                      if (snapshot.hasData) {
                                        var snapshotList =
                                            snapshot.data as List;
                                        var checkSchedule = DateTime.parse(
                                            '${_selectedDay.toString().substring(0, 10)}' +
                                                ' ' +
                                                '${_selectedTime[index].start.format(context)}' +
                                                ':00.000Z');
                                        return Column(
                                          children: [
                                            checkSessionAvailability(
                                                        snapshotList,
                                                        checkSchedule) ==
                                                    true
                                                ? GestureDetector(
                                                    onTap: () => Get.snackbar(
                                                        'Sessão indisponível',
                                                        'A sessão selecionada não está disponível.',
                                                        snackPosition:
                                                            SnackPosition.TOP),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color:
                                                                Palette.cinza),
                                                        child: TimelineTile(
                                                          indicatorStyle:
                                                              IndicatorStyle(
                                                                  width: 0),
                                                          beforeLineStyle:
                                                              const LineStyle(
                                                            color: Palette
                                                                .cinzaClaroTransparente,
                                                            thickness: 0,
                                                          ),
                                                          endChild: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Column(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                                      child: Text(
                                                                                        'Início:',
                                                                                        style: TextStyle(color: Palette.cinzaClaro),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(color: Palette.cinzaClaroTransparente, borderRadius: BorderRadius.circular(20)),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: GestureDetector(
                                                                                          onTap: null,
                                                                                          child: Text(
                                                                                            _selectedTime[index].start.format(context),
                                                                                            style: TextStyle(color: Palette.cinzaClaro),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                  child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Fim:',
                                                                                      style: TextStyle(color: Palette.cinzaClaro),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )),
                                                                              Flexible(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(color: Palette.cinzaClaroTransparente, borderRadius: BorderRadius.circular(20)),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Text(calculateSessionEnd(_selectedTime[index].start.format(context)), style: TextStyle(color: Palette.cinzaClaro)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: Column(
                                                                                  children: [
                                                                                    GestureDetector(
                                                                                      child: OrionButtonWidget(
                                                                                          icon: Icon(
                                                                                        Icons.arrow_forward,
                                                                                        color: Palette.cinzaClaro,
                                                                                      )),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: TimelineTile(
                                                      indicatorStyle:
                                                          IndicatorStyle(
                                                              width: 0),
                                                      beforeLineStyle:
                                                          const LineStyle(
                                                        color: Palette
                                                            .cinzaClaroTransparente,
                                                        thickness: 0,
                                                      ),
                                                      endChild: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0),
                                                                                  child: Text('Início:'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(color: Palette.cinza, borderRadius: BorderRadius.circular(20)),
                                                                              child: Column(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: GestureDetector(
                                                                                      onTap: null,
                                                                                      child: Text(_selectedTime[index].start.format(context)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Center(
                                                                              child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text('Fim:'),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(color: Palette.cinza, borderRadius: BorderRadius.circular(20)),
                                                                              child: Column(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Text(calculateSessionEnd(_selectedTime[index].start.format(context))),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: (() => {
                                                                                        Get.to(() => PaymentPage(), arguments: [
                                                                                          itineraryLogic.itinerary,
                                                                                          _selectedDay,
                                                                                          _selectedTime[index].start.format(context),
                                                                                          calculateSessionEnd(_selectedTime[index].start.format(context))
                                                                                        ])
                                                                                      }),
                                                                                  child: OrionButtonWidget(
                                                                                      icon: Icon(
                                                                                    Icons.arrow_forward,
                                                                                    color: Palette.branco,
                                                                                  )),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                          ],
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    });
                              },
                            );
                          });
                        }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
