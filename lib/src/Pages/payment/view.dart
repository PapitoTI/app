import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/itinerary_page_title_widget.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class PaymentPage extends StatelessWidget {
  final logic = Get.put(PaymentLogic());
  final homeBaseLogic = Get.find<HomeBaseLogic>();

  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var dateSelected = DateFormat('dd/MM/yyyy').format(arguments[1]);
    var dateSchedule = DateTime.parse(
        DateFormat('yyyy-MM-dd').format(arguments[1]) +
            ' ' +
            arguments[2].toString() +
            ':00.000Z');
    return FutureBuilder<TouristModel>(
      future: homeBaseLogic.session.getTouristData(),
      builder: (context, snapshot) {
        var touristModel = snapshot.data;
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Ceu.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
            ),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [BackButtonWidget(title: "Pagamento")],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItineraryPageTitleWidget(
                      title: arguments[0].name,
                      category: arguments[0].category,
                      duration: durationToHours(calculateTotalDurationToMinutes(
                          arguments[0].spotDuration)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Palette.cinzaTransparente),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        'Você selecionou uma sessão para o dia:',
                                        style: TextStyle(fontSize: 18)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        dateSelected,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Sessão: ',
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                        Text(arguments[2].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Text(' às ',
                                            style: TextStyle(fontSize: 18)),
                                        Text(arguments[3].toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleWidget(text: 'Titular do Cartão'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 380,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente,
                        ),
                        child: Text(''),
                      ),
                    ],
                  ),
                  TitleWidget(text: 'Número do Cartão'),
                  Container(
                    width: 380,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 48,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.84),
                            color: Palette.cinza,
                          ),
                          child: Icon(
                            FontAwesomeIcons.ccMastercard,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TitleWidget(text: 'Data de validade:'),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(''),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            TitleWidget(text: 'CVV:'),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.cinzaTransparente),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(''),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleWidget(text: 'Preço:'),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Palette.cinzaTransparente,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Palette.cinzaTransparente,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  arguments[0]
                                      .price
                                      .toStringAsFixed(2)
                                      .replaceAll('.', ',')
                                      .toString(),
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
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
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                            onPressed: (() => {
                                  logic.requestSchedule(
                                      arguments[0],
                                      touristModel!,
                                      dateSchedule,
                                      ScheduleStatus.pending),
                                  Get.snackbar('Roteiro agendado!',
                                      'Aguarde a resposta do guia.'),
                                  homeBaseLogic.update(),
                                }),
                            child: Column(
                              children: [Text('Salvar')],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
