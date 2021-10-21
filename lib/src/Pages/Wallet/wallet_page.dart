import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/payment_model.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  WalletPageState createState() => WalletPageState();
}

class WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    final List<TouristPayment> tourist = [
      TouristPayment("Felipe Ferreira", "R\$ 200,00",
          "assets/images/felipe_turista.jpg", '15/10/2021', 'Paulista1'),
      TouristPayment("Felipe Ferreira", "R\$ 380,00",
          "assets/images/felipe_turista.jpg", '15/10/2021', 'Paulista2'),
      TouristPayment("Weslley", "R\$ 240,00",
          "assets/images/felipe_turista.jpg", '15/10/2021', 'Paulista1'),
    ];

    final List<TouristPayment> tourist2 = [
      TouristPayment("Felipe Ferreira", "R\$ 200,00",
          "assets/images/felipe_turista.jpg", '15/09/2021', 'Paulista1'),
      TouristPayment("Felipe Ferreira", "R\$ 380,00",
          "assets/images/felipe_turista.jpg", '14/09/2021', 'Paulista2'),
      TouristPayment("Weslley", "R\$ 240,00",
          "assets/images/felipe_turista.jpg", '02/09/2021', 'Paulista1'),
    ];

    return SafeArea(
      child: Scaffold(
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
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BackButtonWidget(title: "Carteira")],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 340,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ganhos",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "R\$ 6.350,00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                    height: 25,
                    thickness: 2,
                    color: Palette.branco.withOpacity(.4)),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: Text(
                    "Extrato",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: Text(
                    "Outubro",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tourist.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            // width: 350,
                            height: 84,
                            decoration:
                                BoxDecoration(color: Palette.cinzaTransparente),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            tourist[index].imageUrl,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tourist[index].destiny,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            tourist[index].name,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Palette.cinzaClaro),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tourist[index].budget,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            tourist[index].dataPay,
                                            style: TextStyle(
                                                color: Palette.cinzaClaro),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: OrionButtonWidget(
                                              icon: Icon(
                                            Icons.arrow_forward,
                                            color: Palette.branco,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Divider(
                    height: 25,
                    thickness: 2,
                    color: Palette.branco.withOpacity(.4)),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: Text(
                    "Setembro",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tourist2.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            // width: 350,
                            height: 84,
                            decoration:
                                BoxDecoration(color: Palette.cinzaTransparente),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            tourist2[index].imageUrl,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tourist2[index].destiny,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            tourist2[index].name,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Palette.cinzaClaro),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tourist2[index].budget,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            tourist2[index].dataPay,
                                            style: TextStyle(
                                                color: Palette.cinzaClaro),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: OrionButtonWidget(
                                              icon: Icon(
                                            Icons.arrow_forward,
                                            color: Palette.branco,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
