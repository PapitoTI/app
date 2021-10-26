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
      TouristPayment("Lucas Tomaz", "R\$ 200,00", "assets/images/Lucas.jpg",
          '20/10/2021', 'Paulista 1'),
      TouristPayment("Bruno Garcia", "R\$ 380,00", "assets/images/Bruno.jpg",
          '18/10/2021', 'Paulista 2'),
      TouristPayment("Weslley Francis", "R\$ 50,00",
          "assets/images/Weslley.jpg", '15/10/2021', 'Parque do Carmo'),
      TouristPayment("Weslley", "R\$ 90,00", "assets/images/Weslley.jpg",
          '15/10/2021', 'Rua Augusta'),
      TouristPayment("Lucas Tomaz", "R\$ 80,00", "assets/images/Lucas.jpg",
          '14/10/2021', 'Parada Inglesa'),
      TouristPayment("Bruno Garcia", "R\$ 150,00", "assets/images/Bruno.jpg",
          '14/10/2021', 'Pico do Jaraqua'),
      TouristPayment("Weslley Francis", "R\$ 150,00",
          "assets/images/Weslley.jpg", '12/10/2021', 'Cantareira'),
      TouristPayment("Weslley", "R\$ 90,00", "assets/images/Weslley.jpg",
          '10/10/2021', 'Mosteiro da Sé'),
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
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -35,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/felipe_turista.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Palette.cinzaTransparente,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 340,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Ganhos",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "R\$ 6.350,00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: Text(
                    "Extrato",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tourist.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: 350,
                            height: 84,
                            decoration: BoxDecoration(
                              color: Palette.cinzaTransparente,
                              borderRadius: BorderRadius.circular(10),
                            ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
