import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/mock.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_g_editable_widget.dart';
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

class EditItineraryPage extends StatefulWidget {
  @override
  _EditItineraryPageState createState() => _EditItineraryPageState();
}

class _EditItineraryPageState extends State<EditItineraryPage> {
  // final TouristHomeLogic touristHomeLogic = Get.find<TouristHomeLogic>();
  final logic = Get.put(EditItineraryLogic(Get.arguments));
  var _selectedDuration;
  var _selectedTime;

  Future<void> _showDurationPicker(index) async {
    final Duration? result = await showDurationPicker(
      context: context,
      initialTime: logic.itineraryEditable.spotDuration[index],
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
                logic.itineraryEditable.spotDuration))));
    return endDuration.format(context);
  }

  TimeOfDay minutesToTimeOfDay(int minutes) {
    Duration duration = Duration(minutes: minutes);
    List<String> parts = duration.toString().split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  Widget build(BuildContext context) {
    _selectedDuration = logic.itineraryEditable.spotDuration;
    _selectedTime = logic.itineraryEditable.sessionsList;
    return GetBuilder<HomeBaseLogic>(builder: (homeBaseLogic) {
      return GetBuilder<EditItineraryLogic>(builder: (edit) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BackButtonWidget(title: 'Editar roteiro'),
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
                                logic.itineraryEditable.name = name;
                              },
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              initialValue: logic.itineraryEditable.name,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TitleWidget(text: 'Locais do roteiro:'),
                  Container(
                    width: 1000,
                    height: 300,
                    child: ListView.builder(
                        itemCount: logic.itineraryEditable.spotsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CardGEditableWidget(
                                  spotName: logic
                                      .itineraryEditable.spotsList[index].name,
                                  spotAddress: logic.itineraryEditable
                                      .spotsList[index].address,
                                  spotImagesList: logic.itineraryEditable
                                      .spotsList[index].spotImagesList[0],
                                  index: index));
                        }),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: OrionButtonWidget(
                        text: 'Adicionar local',
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
                              GetBuilder<EditItineraryLogic>(builder: (edit) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        edit.itineraryEditable.spotsList.length,
                                    itemBuilder: (ctx, index) {
                                      return TimelineTile(
                                        indicatorStyle:
                                            IndicatorStyle(width: 15),
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
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: GetBuilder<
                                                                  HomeBaseLogic>(
                                                              builder: (home) {
                                                            return UserAvatarWidget(
                                                                height: 70,
                                                                width: 70,
                                                                image: home
                                                                    .session
                                                                    .getImage(edit
                                                                        .itineraryEditable
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
                                                                    child: Text(edit
                                                                        .itineraryEditable
                                                                        .spotsList[
                                                                            index]
                                                                        .name),
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
                                                                              _showDurationPicker(index)
                                                                            }),
                                                                        child: Text(
                                                                            durationToHours(_selectedDuration[index].inMinutes)),
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                    Text(edit
                                                                        .itineraryEditable
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
                                    });
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleWidget(text: 'Descrição:'),
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
                              initialValue: logic.itineraryEditable.description,
                              onChanged: (description) {
                                logic.itineraryEditable.description =
                                    description;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TitleWidget(text: 'Dias de atuação:'),
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
                            logic.itineraryEditable.weekdays[index] =
                                !logic.itineraryEditable.weekdays[index];
                            print(logic.itineraryEditable.weekdays);
                            print(weekdays);
                            logic.update();
                          },
                          values: logic.itineraryEditable.weekdays,
                        ),
                      ],
                    ),
                  ),
                  TitleWidget(text: 'Sessões disponíveis:'),
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
                                  'Sessões disponíveis',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              GetBuilder<EditItineraryLogic>(builder: (edit) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: edit
                                        .itineraryEditable.sessionsList.length,
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
                                                                        child: Text(
                                                                            _selectedTime[index].format(context)),
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
                                                edit.update()
                                              }),
                                          child: Text('Remover sessão'))),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: ElevatedButton(
                                          onPressed: (() => {
                                                _selectedTime.add(TimeOfDay(
                                                    hour: 00, minute: 00)),
                                                logic.update()
                                              }),
                                          child: Text('Adicionar sessão'))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleWidget(text: 'Preço:'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: Palette.preto),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          style: TextStyle(fontSize: 30),
                                          initialValue: logic
                                              .itineraryEditable.price
                                              .toStringAsFixed(2)
                                              .replaceAll('.', ','),
                                          onChanged: (price) {
                                            var priceToDouble = double.tryParse(
                                                    price.toString())! +
                                                0.00;
                                            logic.itineraryEditable.price =
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
                                logic.itineraryEditable.spotDuration =
                                    _selectedDuration,
                                logic.itineraryEditable.sessionsList =
                                    _selectedTime,
                                logic.saveItinerary(),
                                logic.update()
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
      });
    });
  }

  @override
  void dispose() {
    Get.delete<EditItineraryLogic>();
    super.dispose();
  }
}
