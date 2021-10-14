import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/schedule/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../card_p_widget.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key? key}) : super(key: key);

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
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

  @override
  Widget build(BuildContext context) {
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
                    markersMaxCount: 1,
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
              return ListView.builder(
                itemCount: value
                    .where((element) =>
                        element.scheduleStatus.toString() ==
                        'ScheduleStatus.approved')
                    .toList()
                    .length,
                itemBuilder: (context, index) {
                  var _filteredArray = value
                      .where((element) =>
                          element.scheduleStatus.toString() ==
                          'ScheduleStatus.approved')
                      .toList();
                  if (!(_filteredArray.length == 0)) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<ItineraryLogic>(builder: (itinerary) {
                        return GestureDetector(
                          onTap: (() => {
                                itinerary.insertItinerary(
                                    _filteredArray[index].itinerary),
                                Get.to(() => SchedulePage(),
                                    arguments: homeBaseLogic.schedules[index])
                              }),
                          child: CardPWidget(
                            title: _filteredArray[index].itinerary.name,
                            image: _filteredArray[index]
                                .itinerary
                                .spotsList[0]
                                .spotImagesList[0],
                            description:
                                _filteredArray[index].touristModel.name,
                            info: 'info',
                          ),
                        );
                      }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
