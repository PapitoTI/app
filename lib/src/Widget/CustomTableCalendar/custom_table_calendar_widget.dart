import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../card_p_widget.dart';
import 'utils.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key? key}) : super(key: key);

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _firstDay = DateTime.utc(2010, 10, 16);
  DateTime _lastDay = DateTime.utc(2030, 10, 16);
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

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  // List<Event> _getEventsForRange(DateTime start, DateTime end) {
  //   // Implementation example
  //   final days = daysInRange(start, end);
  //
  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }

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
      // _selectedEvents.value = _getEventsForRange(start, end);
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
            child: TableCalendar<Event>(
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
                  headerMargin: EdgeInsets.all(8),
                  titleTextStyle: TextStyle(color: Colors.white),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  decoration: BoxDecoration(
                    color: Palette.cinzaTransparente,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin:
                            Alignment(-1.467097520828247, -0.3287612795829773),
                        end:
                            Alignment(0.3287612795829773, -0.44422397017478943),
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
                rowDecoration: BoxDecoration(color: Palette.cinzaTransparente),
                holidayDecoration:
                    BoxDecoration(color: Palette.cinzaTransparente),
                defaultTextStyle: TextStyle(color: Colors.white),
                markerDecoration: BoxDecoration(
                    color: Palette.branco,
                    borderRadius: BorderRadius.circular(10)),
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardPWidget(title: '${value[index]}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
