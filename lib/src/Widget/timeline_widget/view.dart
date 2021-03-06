import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../user_avatar_widget.dart';
import 'logic.dart';

class TimelineWidgetPage extends StatefulWidget {
  @override
  _TimelineWidgetPageState createState() => _TimelineWidgetPageState();
}

class _TimelineWidgetPageState extends State<TimelineWidgetPage> {
  final logic = Get.put(TimelineWidgetLogic());
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Container(
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
                      'Linha do Tempo',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  GetBuilder<ItineraryLogic>(builder: (itinerary) {
                    return GetBuilder<TimelineWidgetLogic>(builder: (timeline) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: home.itinerary.spotsList.length,
                          itemBuilder: (ctx, index) {
                            return TimelineTile(
                              indicatorStyle: IndicatorStyle(width: 15),
                              beforeLineStyle: const LineStyle(
                                thickness: 2,
                              ),
                              endChild: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: UserAvatarWidget(
                                                    height: 70,
                                                    width: 70,
                                                    image: home.session
                                                        .getImage(home
                                                            .itinerary
                                                            .spotsList[index]
                                                            .spotImagesList[0])),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Text(home
                                                                .itinerary
                                                                .spotsList[
                                                                    index]
                                                                .name),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(durationToHours(
                                                              itinerary
                                                                  .itinerary
                                                                  .spotDuration[
                                                                      index]
                                                                  .inMinutes)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Palette
                                                              .cinzaClaro),
                                                      child: Center(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(home
                                                                .itinerary
                                                                .spotsList[
                                                                    index]
                                                                .category),
                                                          ],
                                                        ),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          });
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

// @override
// void dispose() {
//   Get.delete<TimelineWidgetLogic>();
//   super.dispose();
// }
}
