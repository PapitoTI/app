import 'package:app/src/Pages/edit_itinerary/view.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Widget/description_widget.dart';
import 'package:app/src/Widget/itinerary_info_widget.dart';
import 'package:app/src/Widget/itinerary_page_title_widget.dart';
import 'package:app/src/Widget/timeline_widget/view.dart';
import 'package:app/src/Widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItineraryPage extends StatefulWidget {
  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  // final TouristHomeLogic touristLogic = Get.find<TouristHomeLogic>();

  var _itinerary = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Roteiro'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                if (home.session is GuideServerConnectionInterface)
                  Container(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: (() => {
                                  Get.to(() => EditItineraryPage(),
                                      arguments: _itinerary)
                                }),
                            child: Text('Editar'))),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItineraryPageTitleWidget(
                    title: _itinerary.name,
                    category: _itinerary.category,
                    duration: '_itinerary.totalTime',
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

  // @override
  // void dispose() {
  //   Get.delete<ItineraryLogic>();
  //   super.dispose();
  // }
}
