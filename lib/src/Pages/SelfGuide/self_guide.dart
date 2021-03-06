import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/SelfGuide/tour_self_guide.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelfGuide extends StatefulWidget {
  @override
  _SelfGuideState createState() => _SelfGuideState();
}

class _SelfGuideState extends State<SelfGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //height: _screenSize.height * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [BackButtonWidget(title: "Destino")],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 328,
                  height: 109,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Container(
                          alignment: Alignment.center,
                          width: 78,
                          height: 29,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Palette.cinzaTransparente,
                          ),
                          child: Text(
                            "Life Urban",
                            style:
                                TextStyle(fontSize: 12, color: Palette.branco),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Avenida Paulista",
                          style: TextStyle(fontSize: 28, color: Palette.branco),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "4h de dura????o prevista",
                          style: TextStyle(
                              fontSize: 12, color: Palette.cinzaClaro),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 43),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Descri????o do roteiro:",
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: 328,
                  height: 460,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                        "Idealizada nos ??ltimos anos do s??culo XIX por Joaquim Eug??nio de Lima e Clementino de Souza Castro, a Avenida Paulista teve sua inaugura????o em 1891 para atender um pedido da elite paulistana de expandir o valorizado centro paulistano que j?? estava quase que inteiramente ocupado.\n\nPara a Paulista, mudaram-se inicialmente fam??lias ricas menos tradicionais, oriundas de diferentes nacionalidades. Cada um levava ?? arquitetura de suas casas refer??ncias de seus pa??ses, explica o especialista em hist??ria da arquitetura, Jos?? Eduardo Lef??vre.\n\nDe l?? para c??, a regi??o viu a cidade crescer economicamente em seu entorno, tornando-se um ??cone cultural, comercial e econ??mico da capital paulista. N??o ?? toa ?? um dos endere??os mais procurados pelos cerca de 15 milh??es de turistas que visitam a cidade todos os anos ??? alguns inclusive se empolgam, acabam procurando apartamentos ?? venda em S??o Paulo e passam a morar na regi??o em fun????o da grande oferta de atra????es como cinemas, centros culturais, museus, bares e restaurantes."),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: 328,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 54,
                        height: 51,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/100.png"),
                              scale: .9),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Free",
                            style:
                                TextStyle(color: Palette.branco, fontSize: 20),
                          ),
                          Text("Pre??o",
                              style: TextStyle(
                                  color: Palette.cinzaClaro, fontSize: 14))
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 54,
                        height: 51,
                        child: Icon(
                          FontAwesomeIcons.clock,
                          size: 40,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "60 min",
                            style:
                                TextStyle(color: Palette.branco, fontSize: 20),
                          ),
                          Text("Pausa",
                              style: TextStyle(
                                  color: Palette.cinzaClaro, fontSize: 14))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Get.to(TourSelfGuide()),
                    child: Text(
                      "Iniciar Roteiro",
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Palette.cinzaClaroTransparente,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: Size(
                        211,
                        72,
                      ),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
