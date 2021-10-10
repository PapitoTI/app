import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
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
import 'package:weekday_selector/weekday_selector.dart';

class ItineraryPage extends StatefulWidget {
  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  // final TouristHomeLogic touristLogic = Get.find<TouristHomeLogic>();0
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();
  var _itinerary = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      home.itinerary = _itinerary;
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
                              values: _itinerary.weekdays),
                        )
                      ],
                    ),
                  ),
                )
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
