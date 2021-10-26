import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/menu/version.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  Widget build(BuildContext context) {
    return FutureBuilder<TouristModel>(
      future: homeBaseLogic.session.getTouristData(),
      builder: (context, snapshot) {
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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perfil',
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  height: 189,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Palette.cinzaTransparente,
                            ),
                            child: homeBaseLogic.session
                                .getImage(snapshot.data!.imageUrl)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data!.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 95,
                              height: 59,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.cinzaTransparente,
                              ),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "20",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  // SizedBox(height: 8),
                                  Text(
                                    "Roteiros realizados",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              )),
                            ),
                            Container(
                              width: 95,
                              height: 59,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.cinzaTransparente,
                              ),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "5",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  // SizedBox(height: 8),
                                  Text(
                                    "Nível",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidAddressCard,
                          size: 40,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Meus dados",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Altere suas informações \npessoais",
                              style: TextStyle(
                                  fontSize: 14, color: Palette.cinzaClaro),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 360,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Palette.cinzaTransparente,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidAddressBook,
                          size: 40,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Minha agenda",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Altere suas informações \npessoais",
                              style: TextStyle(
                                  fontSize: 14, color: Palette.cinzaClaro),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () => Get.to(Version()),
                  child: Container(
                    width: 360,
                    height: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Palette.cinzaTransparente,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.bug,
                            size: 40,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Reporte",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Caso aja necessidade",
                                style: TextStyle(
                                    fontSize: 14, color: Palette.cinzaClaro),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
