import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/add_spots/view.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Widget/card_g_editable_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'logic.dart';

class CreateItineraryPage extends StatefulWidget {
  @override
  _CreateItineraryPageState createState() => _CreateItineraryPageState();
}

class _CreateItineraryPageState extends State<CreateItineraryPage> {
  final logic = Get.put(CreateItineraryLogic());
  var _selectedTime;

  Future<void> _show(index) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: logic.itinerary.spotDuration[index],
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

  @override
  Widget build(BuildContext context) {
    _selectedTime = logic.itinerary.spotDuration.obs;
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return GetBuilder<CreateItineraryLogic>(builder: (create) {
        String? itineraryTitle;
        String? itineraryDescription;
        List<bool>? itineraryWeekdays;
        List<TimeOfDay>? itineraryDuration;
        double? itineraryPrice;
        String? itineraryCategory;
        return Scaffold(
          appBar: AppBar(
            title: Text('Criar roteiro'),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                TitleWidget(text: 'Nome do roteiro:'),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.cinzaTransparente),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onChanged: (title) {
                              itineraryTitle = title;
                            },
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
                TitleWidget(text: 'Locais do roteiro:'),
                GetBuilder<CreateItineraryLogic>(builder: (logic) {
                  if (create.itinerary.spotsList.length >= 1) {
                    return Container(
                        width: 1000,
                        height: 300,
                        child: ListView.builder(
                            itemCount: create.itinerary.spotsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(create.itinerary.spotsList.length
                                          .toString()),
                                      CardGEditableWidget(
                                          spotName: create
                                              .itinerary.spotsList[index].name,
                                          spotAddress: create.itinerary
                                              .spotsList[index].address,
                                          spotImagesList: create
                                              .itinerary
                                              .spotsList[index]
                                              .spotImagesList[0],
                                          index: index),
                                    ],
                                  ));
                            }));
                  } else {
                    return Text('Nenhum local adicionado!');
                  }
                }),
                Container(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (() => {Get.to(AddSpotsPage())}),
                      child: OrionButtonWidget(
                        text: 'Adicionar local',
                      ),
                    ),
                  ),
                ),
                TitleWidget(text: 'Tempo previsto em cada local:'),
                GetBuilder<CreateItineraryLogic>(builder: (logic) {
                  if (create.itinerary.spotsList.length >= 1) {
                    return Container(
                        width: 1000,
                        height: 300,
                        child: ListView.builder(
                            itemCount: create.itinerary.spotsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Palette.cinzaTransparente,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Linha do Tempo',
                                              style: TextStyle(fontSize: 22),
                                            ),
                                          ),
                                          GetBuilder<CreateItineraryLogic>(
                                              builder: (logic) {
                                            List<TimeOfDay> itineraryDuration =
                                                logic.itinerary.spotDuration;
                                            return ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: logic
                                                    .itinerary.spotsList.length,
                                                itemBuilder: (ctx, index) {
                                                  return TimelineTile(
                                                    indicatorStyle:
                                                        IndicatorStyle(
                                                            width: 15),
                                                    beforeLineStyle:
                                                        const LineStyle(
                                                      thickness: 2,
                                                    ),
                                                    endChild: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      child: UserAvatarWidget(
                                                                          height: 70,
                                                                          width: 70,
                                                                          image: home.session.getImage(
                                                                            logic.itinerary.spotsList[index].spotImagesList[0],
                                                                          )),
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
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 8.0),
                                                                                child: Text(logic.itinerary.spotsList[index].name),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(color: Palette.cinza, borderRadius: BorderRadius.circular(20)),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: GestureDetector(
                                                                                    onTap: (() => {
                                                                                          _show(index)
                                                                                        }),
                                                                                    child: Text(_selectedTime[index].format(context)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              35,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              color: Palette.cinzaClaro),
                                                                          child: Center(
                                                                              child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(logic.itinerary.spotsList[index].category),
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
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Align(
                                          //         alignment: Alignment.topRight,
                                          //         child: ElevatedButton(
                                          //             onPressed: (() =>
                                          //                 {_controller.timelineNameDB.removeLast()}),
                                          //             child: Text('Remover local'))),
                                          //     Align(
                                          //         alignment: Alignment.topRight,
                                          //         child: ElevatedButton(
                                          //             onPressed: (() =>
                                          //                 {_controller.timelineNameDB.add('Local')}),
                                          //             child: Text('Adicionar local'))),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }));
                  } else {
                    return Text('Nenhum local adicionado!');
                  }
                }),
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
                            onChanged: (description) {
                              itineraryDescription = description;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TitleWidget(text: 'Categoria:'),
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
                            onChanged: (category) {
                              itineraryCategory = category;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
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
                                        onChanged: (price) {
                                          var priceToDouble = double.tryParse(
                                                  price.toString())! +
                                              0.00;
                                          itineraryPrice = priceToDouble;
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                        onPressed: null,
                        child: Column(
                          children: [Text('Cancelar')],
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                        onPressed: (() => {
                              itineraryDuration = _selectedTime,
                              create.saveItinerary(
                                  itineraryTitle!,
                                  itineraryDescription!,
                                  itineraryCategory!,
                                  weekdays,
                                  itineraryPrice!,
                                  itineraryDuration!)
                            }),
                        child: Column(
                          children: [Text('Salvar')],
                        )),
                  ],
                ),
              ],
            ),
          )),
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
