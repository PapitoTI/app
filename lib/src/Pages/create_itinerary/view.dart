import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Pages/add_spots/view.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_g_creatable_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'logic.dart';

class CreateItineraryPage extends StatefulWidget {
  @override
  _CreateItineraryPageState createState() => _CreateItineraryPageState();
}

class _CreateItineraryPageState extends State<CreateItineraryPage> {
  final logic = Get.put(CreateItineraryLogic());
  final itineraryLogic = Get.find<ItineraryLogic>();
  var _selectedDuration;
  var _selectedTime;
  //List<TimeOfDay> _selectedTime = [TimeOfDay(hour: 00, minute: 00)];

  Future<void> _showDurationPicker(index) async {
    final Duration? result = await showDurationPicker(
      context: context,
      initialTime: logic.itineraryCreatable.spotDuration[index],
    );
    if (result != null) {
      _selectedDuration[index] = result;
      logic.update();
    }
  }

  Future<void> _showTimePicker(index) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: _selectedTime[index],
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (result != null) {
      var resultHour = result.hour.toString().length < 2
          ? ('0' + result.hour.toString())
          : result.hour.toString();
      var resultMinute = result.minute.toString().length < 2
          ? ('0' + result.minute.toString())
          : result.minute.toString();
      _selectedTime[index] = TimeOfDay.fromDateTime(
          DateTime.parse('0000-00-00 $resultHour:$resultMinute'));
      logic.update();
    }
  }

  String calculateSessionEnd(String start) {
    var endDuration = TimeOfDay.fromDateTime(DateTime.parse('0000-00-00 $start')
        .add(Duration(
            minutes: calculateTotalDurationToMinutes(
                logic.itineraryCreatable.spotDuration))));
    return endDuration.format(context);
  }

  TimeOfDay minutesToTimeOfDay(int minutes) {
    Duration duration = Duration(minutes: minutes);
    List<String> parts = duration.toString().split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  Widget build(BuildContext context) {
    _selectedDuration = logic.itineraryCreatable.spotDuration;
    _selectedTime = logic.itineraryCreatable.sessionsList;
    return GetBuilder<HomeBaseLogic>(builder: (homeBaseLogic) {
      return GetBuilder<CreateItineraryLogic>(builder: (create) {
        return FutureBuilder(
          future: homeBaseLogic.session.getGuideData(),
          builder: (context, snapshot) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackButtonWidget(title: 'Criar roteiro'),
                      ),
                      TitleWidget(text: 'Nome do roteiro:'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onChanged: (name) {
                                    logic.itineraryCreatable.name = name;
                                  },
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  initialValue: logic.itineraryCreatable.name,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TitleWidget(text: 'Categoria do roteiro:'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onChanged: (category) {
                                    logic.itineraryCreatable.category =
                                        category;
                                  },
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  initialValue: logic.itineraryCreatable.name,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TitleWidget(text: 'Locais do roteiro:'),
                      if (logic.itineraryCreatable.spotsList.isEmpty)
                        Container(),
                      if (logic.itineraryCreatable.spotsList.isNotEmpty)
                        Container(
                          width: 1000,
                          height: 300,
                          child: ListView.builder(
                              itemCount:
                                  logic.itineraryCreatable.spotsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CardGCreatableWidget(
                                        spotName: logic.itineraryCreatable
                                            .spotsList[index].name,
                                        spotAddress: logic.itineraryCreatable
                                            .spotsList[index].address,
                                        spotImagesList: logic.itineraryCreatable
                                            .spotsList[index].spotImagesList[0],
                                        index: index));
                              }),
                        ),
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => Get.to(() => AddSpotsPage()),
                            child: OrionButtonWidget(
                              text: 'Adicionar local',
                            ),
                          ),
                        ),
                      ),
                      TitleWidget(text: 'Tempo previsto em cada local:'),
                      Container(
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
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: logic
                                          .itineraryCreatable.spotsList.length,
                                      itemBuilder: (ctx, index) {
                                        return TimelineTile(
                                          indicatorStyle:
                                              IndicatorStyle(width: 15),
                                          beforeLineStyle: const LineStyle(
                                            thickness: 2,
                                          ),
                                          endChild: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: GetBuilder<
                                                                    HomeBaseLogic>(
                                                                builder:
                                                                    (home) {
                                                              return UserAvatarWidget(
                                                                  height: 70,
                                                                  width: 70,
                                                                  image: home.session.getImage(logic
                                                                      .itineraryCreatable
                                                                      .spotsList[
                                                                          index]
                                                                      .spotImagesList[0]));
                                                            }),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                                                      child: Text(logic
                                                                          .itineraryCreatable
                                                                          .spotsList[
                                                                              index]
                                                                          .name),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
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
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: (() =>
                                                                              {
                                                                                _showDurationPicker(index)
                                                                              }),
                                                                          child:
                                                                              Text(durationToHours(_selectedDuration[index].inMinutes)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: Palette
                                                                        .cinzaClaro),
                                                                child: Center(
                                                                    child:
                                                                        Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(logic
                                                                          .itineraryCreatable
                                                                          .spotsList[
                                                                              index]
                                                                          .category),
                                                                    ],
                                                                  ),
                                                                )),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TitleWidget(text: 'Descri????o:'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 35,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  initialValue:
                                      logic.itineraryCreatable.description,
                                  onChanged: (description) {
                                    logic.itineraryCreatable.description =
                                        description;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TitleWidget(text: 'Dias de atua????o:'),
                      Container(
                        decoration: BoxDecoration(
                            color: Palette.cinzaTransparente,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            WeekdaySelector(
                              firstDayOfWeek: 0,
                              onChanged: (int day) {
                                final index = day % 7;
                                logic.itineraryCreatable.weekdays[index] =
                                    !logic.itineraryCreatable.weekdays[index];
                                logic.update();
                              },
                              values: logic.itineraryCreatable.weekdays,
                            ),
                          ],
                        ),
                      ),
                      TitleWidget(text: 'Sess??es dispon??veis:'),
                      Container(
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
                                      'Sess??es dispon??veis',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  GetBuilder<CreateItineraryLogic>(
                                      builder: (create) {
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: logic.itineraryCreatable
                                            .sessionsList.length,
                                        itemBuilder: (ctx, index) {
                                          return TimelineTile(
                                            indicatorStyle:
                                                IndicatorStyle(width: 0),
                                            beforeLineStyle: const LineStyle(
                                              color: Palette
                                                  .cinzaClaroTransparente,
                                              thickness: 0,
                                            ),
                                            endChild: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                                        padding:
                                                                            const EdgeInsets.only(left: 8.0),
                                                                        child: Text(
                                                                            '??nicio:'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Palette
                                                                            .cinza,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: (() =>
                                                                                {
                                                                                  _showTimePicker(index)
                                                                                }),
                                                                            child:
                                                                                Text(_selectedTime[index].format(context)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                    child:
                                                                        Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          'Fim:'),
                                                                    ],
                                                                  ),
                                                                )),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Palette
                                                                            .cinza,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(calculateSessionEnd(_selectedTime[index].format(context))),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          );
                                        });
                                  }),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: ElevatedButton(
                                              onPressed: (() => {
                                                    _selectedTime.removeLast(),
                                                    logic.update()
                                                  }),
                                              child: Text('Remover sess??o'))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: ElevatedButton(
                                              onPressed: (() => {
                                                    _selectedTime.add(TimeOfDay(
                                                        hour: 00, minute: 00)),
                                                    logic.update()
                                                  }),
                                              child: Text('Adicionar sess??o'))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TitleWidget(text: 'Pre??o:'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Palette.cinzaTransparente),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'R\$',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Palette.preto),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none),
                                              style: TextStyle(fontSize: 30),
                                              initialValue: logic
                                                  .itineraryCreatable.price
                                                  .toStringAsFixed(2)
                                                  .replaceAll('.', ','),
                                              onChanged: (price) {
                                                var priceToDouble =
                                                    double.tryParse(
                                                            price.toString())! +
                                                        0.00;
                                                logic.itineraryCreatable.price =
                                                    priceToDouble;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                              onPressed: () => Get.back(),
                              child: Column(
                                children: [Text('Cancelar')],
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                              onPressed: (() => {
                                    logic.itineraryCreatable.spotDuration =
                                        _selectedDuration,
                                    logic.itineraryCreatable.sessionsList =
                                        _selectedTime,
                                    logic.itineraryCreatable.guideModel =
                                        snapshot.data as GuideModel,
                                    logic.saveItinerary(
                                        logic.itineraryCreatable),
                                    print(logic.itineraryCreatable),
                                    logic.update(),
                                    Get.snackbar('Roteiro criado!',
                                        'Seu novo roteiro foi criado com sucesso.')
                                  }),
                              child: Column(
                                children: [Text('Salvar')],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
    });
  }

  @override
  void dispose() {
    Get.delete<CreateItineraryLogic>();
    super.dispose();
  }
}
