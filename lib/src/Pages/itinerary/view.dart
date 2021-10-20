import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/create_schedule/view.dart';
import 'package:app/src/Pages/edit_itinerary/view.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/description_widget.dart';
import 'package:app/src/Widget/itinerary_info_widget.dart';
import 'package:app/src/Widget/itinerary_page_title_widget.dart';
import 'package:app/src/Widget/timeline_widget/view.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:app/src/Widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ItineraryPage extends StatefulWidget {
  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  // final TouristHomeLogic touristLogic = Get.find<TouristHomeLogic>();0
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();
  var _itinerary = Get.arguments;
  var _selectedTime;

  String calculateSessionEnd(String start) {
    var endDuration = TimeOfDay.fromDateTime(DateTime.parse('0000-00-00 $start')
        .add(Duration(
            minutes: calculateTotalDurationToMinutes(
                itineraryLogic.itinerary.spotDuration))));
    return endDuration.format(context);
  }

  Future<void> _showTimePicker(index) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: _selectedTime[index].start,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (result != null) {
      var resultHour = result.hour.toString().length < 2
          ? ('0' + result.hour.toString())
          : result.hour.toString();
      var resultMinute = result.minute.toString().length < 2
          ? ('0' + result.minute.toString())
          : result.minute.toString();
      _selectedTime[index].start = TimeOfDay.fromDateTime(
          DateTime.parse('0000-00-00 $resultHour:$resultMinute'));
      itineraryLogic.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      home.itinerary = _itinerary;
      _selectedTime = itineraryLogic.itinerary.sessionsList;
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonWidget(title: 'Roteiro'),
                      if (home.session is GuideServerConnectionInterface)
                        Container(
                          decoration: BoxDecoration(
                              color: Palette.cinzaTransparente,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: (() => {
                                  Get.to(() => EditItineraryPage(),
                                      arguments: home.itinerary)
                                }),
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItineraryPageTitleWidget(
                    title: _itinerary.name,
                    category: _itinerary.category,
                    duration: durationToHours(calculateTotalDurationToMinutes(
                        _itinerary.spotDuration)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: UserCardWidget(
                    imageUrl:
                        home.session.getImage(_itinerary.guideModel.imageUrl),
                    name: _itinerary.guideModel.name,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: DescriptionWidget(
                              description: _itinerary.description)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: ItineraryInfoWidget(
                    price: _itinerary.price.toStringAsFixed(2),
                    duration: itineraryLogic.totalTime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TimelineWidgetPage(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.cinzaTransparente,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        TitleWidget(text: 'Dias de atuação:'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WeekdaySelector(
                              firstDayOfWeek: 0,
                              onChanged: null,
                              values: home.itinerary.weekdays),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
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
                              GetBuilder<ItineraryLogic>(
                                  builder: (itineraryLogic) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: itineraryLogic
                                        .itinerary.sessionsList.length,
                                    itemBuilder: (ctx, index) {
                                      return TimelineTile(
                                        indicatorStyle:
                                            IndicatorStyle(width: 0),
                                        beforeLineStyle: const LineStyle(
                                          color: Palette.cinzaClaroTransparente,
                                          thickness: 0,
                                        ),
                                        endChild: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                    child: Text(
                                                                        'Ínicio:'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Palette
                                                                        .cinza,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: (() =>
                                                                            {
                                                                              _showTimePicker(index)
                                                                            }),
                                                                        child: Text(_selectedTime[index]
                                                                            .start
                                                                            .format(context)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Center(
                                                                child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Text('Fim:'),
                                                                ],
                                                              ),
                                                            )),
                                                            Flexible(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Palette
                                                                        .cinza,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(calculateSessionEnd(_selectedTime[
                                                                              index]
                                                                          .start
                                                                          .format(
                                                                              context))),
                                                                    ),
                                                                  ],
                                                                ),
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
                                      );
                                    });
                              }),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                            onPressed: (() =>
                                {Get.to(() => CreateSchedulePage())}),
                            child: Column(
                              children: [Text('Agendar')],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }

  // @override
  // void dispose() {
  //   Get.delete<ItineraryLogic>();
  //   super.dispose();
  // }
}
