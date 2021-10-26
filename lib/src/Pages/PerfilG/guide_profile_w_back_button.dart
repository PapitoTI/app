import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/itinerary/view.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_g_widget.dart';
import 'package:app/src/Widget/desc_guide_widget.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:app/src/Widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuideProfileWBackButton extends StatefulWidget {
  const GuideProfileWBackButton({Key? key}) : super(key: key);

  @override
  _GuideProfileWBackButtonState createState() =>
      _GuideProfileWBackButtonState();
}

class _GuideProfileWBackButtonState extends State<GuideProfileWBackButton> {
  var tourist;
  var spotsList;
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GuideModel>(
      future: homeBaseLogic.session.getGuideData(),
      builder: (context, snapshot) {
        return GetBuilder<HomeBaseLogic>(builder: (home) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                BackButtonWidget(
                                  title: 'Perfil',
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: UserCardWidget(
                            imageUrl: homeBaseLogic.session
                                .getImage(snapshot.data!.imageUrl),
                            name: snapshot.data!.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: descGuiaWidget(),
                      ),
                      TitleWidget(text: 'Roteiros deste guia:'),
                      FutureBuilder<List<ItineraryModel>>(
                        future: home.session.getGuideItineraries(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GetBuilder<ItineraryLogic>(
                                          builder: (itinerary) {
                                        return GestureDetector(
                                          onTap: (() => {
                                                home.itinerary =
                                                    snapshot.data![index],
                                                itinerary.insertItinerary(
                                                    snapshot.data![index]),
                                                Get.to(() => ItineraryPage(),
                                                    arguments:
                                                        snapshot.data![index])
                                              }),
                                          child: CardGWidget(
                                            spotName:
                                                snapshot.data?[index].name,
                                            spotAddress: snapshot.data?[index]
                                                .spotsList[0].address,
                                            spotImagesList: snapshot
                                                .data?[index]
                                                .spotsList[0]
                                                .spotImagesList[0],
                                          ),
                                        );
                                      }),
                                    );
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
              ),
            ),
          );
        });
      },
    );
  }
}
