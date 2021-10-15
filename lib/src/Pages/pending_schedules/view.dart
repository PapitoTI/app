import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:app/src/Widget/schedule_card_p_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PendingSchedulesPage extends StatelessWidget {
  final logic = Get.put(PendingSchedulesLogic());
  final state = Get.find<PendingSchedulesLogic>().state;
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackButtonWidget(title: 'Solicitações pendentes'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Solicitações pendentes:',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              FutureBuilder<List<ScheduleModel>>(
                future: homeBaseLogic.session.getSchedules(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data
                              ?.where((element) =>
                                  element.scheduleStatus.toString() ==
                                  'ScheduleStatus.pending')
                              .toList()
                              .length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var _filteredArray = snapshot.data
                                ?.where((element) =>
                                    element.scheduleStatus.toString() ==
                                    'ScheduleStatus.pending')
                                .toList();
                            if (!(_filteredArray!.length == 0)) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ScheduleCardPWidget(
                                    title: _filteredArray[index].itinerary.name,
                                    description:
                                        '${_filteredArray[index].itinerary.spotsList.length} locais',
                                    image: _filteredArray[index]
                                        .itinerary
                                        .spotsList[0]
                                        .spotImagesList[0],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (() async => {
                                              await homeBaseLogic.session
                                                  .cancelSchedule(
                                                      _filteredArray[index]),
                                              home.update()
                                            }),
                                        child: OrionButtonWidget(
                                            icon: Icon(
                                          Icons.cancel,
                                          color: Palette.branco,
                                        )),
                                      ),
                                      GestureDetector(
                                        onTap: (() async => {
                                              await homeBaseLogic.session
                                                  .approveSchedule(
                                                      _filteredArray[index]),
                                              home.update()
                                            }),
                                        child: OrionButtonWidget(
                                            icon: Icon(
                                          Icons.check_circle,
                                          color: Palette.branco,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            } else {
                              return Text('Sem compromissos pendentes!');
                            }
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ));
    });
  }
}
