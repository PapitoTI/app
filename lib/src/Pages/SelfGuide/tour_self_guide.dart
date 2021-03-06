import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/SelfGuide/timeline_guide.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/timeline_widget/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TourSelfGuide extends StatefulWidget {
  @override
  _TourSelfGuideState createState() => _TourSelfGuideState();
}

class _TourSelfGuideState extends State<TourSelfGuide> {
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (_) {
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
                child: Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BackButtonWidget(title: "Avenida Paulista")],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "1?? parada",
                          style: TextStyle(fontSize: 26, color: Palette.branco),
                        ),
                        Text(
                          "1h de dura????o",
                          style: TextStyle(
                              fontSize: 14, color: Palette.cinzaClaro),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 502,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 6, right: 6, top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 66,
                                height: 66,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/CasaDasRosas.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.mapMarkerAlt),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Casa das Rosas",
                                          style: TextStyle(
                                              color: Palette.branco,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Av.Paulista, 37",
                                      style: TextStyle(
                                          color: Palette.cinzaClaro,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "1h",
                                style: TextStyle(
                                    color: Palette.cinzaClaro, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                              "A Casa das Rosas ?? um casar??o no estilo cl??ssico franc??s, localizado na Avenida Paulista. ?? dedicado a diversas manifesta????es culturais, com enfoque em literatura e poesia, na cidade de S??o Paulo. ?? um dos edif??cios remanescente da ??poca caracter??stica da ocupa????o inicial de uma das principais vias da cidade.  "),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8),
                        ),
                        TimelineSelf([
                          "assets/images/StandUp.jpg",
                          "assets/images/Sarau.jpg",
                          "assets/images/ponte.jpeg",
                        ], [
                          "Stand-up po??tico",
                          "Sarau das editoras",
                          "Pontes entre romantismo \ne modernismo"
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2?? parada",
                          style: TextStyle(fontSize: 26, color: Palette.branco),
                        ),
                        Text(
                          "1h de dura????o",
                          style: TextStyle(
                              fontSize: 14, color: Palette.cinzaClaro),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 522,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 6, right: 6, top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 66,
                                height: 66,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/cultura.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.mapMarkerAlt),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Livraria Cultura do \nconjunto nacional",
                                          style: TextStyle(
                                              color: Palette.branco,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Av.Paulista, 2073",
                                      style: TextStyle(
                                          color: Palette.cinzaClaro,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "1h",
                                style: TextStyle(
                                    color: Palette.cinzaClaro, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                              "Desde 1947 ocupa esse endere??o privilegiado da\ncidade, por??m apenas em 2007 foi ampliada e\nganhou a forma que conhecemos hoje com mais \nde 3500m??, tornando-se a maior livraria do pa??s.\nCerca de 10 mil pessoas circulam por l?? diariamente e foi uma das pioneiras em proporcionar uma verdadeira experi??ncia com os livros...  "),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8),
                        ),
                        TimelineSelf([
                          "assets/images/livra.jpg",
                          "assets/images/cine.jpg",
                          "assets/images/livro.jpg",
                        ], [
                          "Tour pela livraria",
                          "Cinema",
                          "Compre um livro"
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3?? parada",
                          style: TextStyle(fontSize: 26, color: Palette.branco),
                        ),
                        Text(
                          "1h de dura????o",
                          style: TextStyle(
                              fontSize: 14, color: Palette.cinzaClaro),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 328,
                    height: 522,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 6, right: 6, top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 66,
                                height: 66,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/mirante.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.mapMarkerAlt),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Mirante do Sesc",
                                          style: TextStyle(
                                              color: Palette.branco,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Av.Paulista, 119",
                                      style: TextStyle(
                                          color: Palette.cinzaClaro,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "1h",
                                style: TextStyle(
                                    color: Palette.cinzaClaro, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                              "Subir ao Mirante do SESC ?? uma ??tima \nmaneira de se preparar para explorar a Avenida Paulista. Do alto, ser?? poss??vel ter uma no????o da grandeza da avenida e de tudo o que te espera por l??! O visual ?? disputado e em dias de c??u limpo e durante o p??r do sol pode at?? ter fila para acessar o mirante..."),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8),
                        ),
                        TimelineSelf([
                          "assets/images/bibli.jpg",
                          "assets/images/sesc.jpg",
                          "assets/images/mira.jpg",
                        ], [
                          "Conhe??a a livraria",
                          "Exposi????o",
                          "Mirante"
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Get.to(HomeBasePage()),
                      child: Text(
                        "Finalizar Roteiro",
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Palette.cinzaClaroTransparente,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: Size(
                          231,
                          72,
                        ),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
          ),
        ),
      );
    });
  }
}
