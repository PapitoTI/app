import 'package:app/src/Config/helpers.dart';
import 'package:app/src/Config/images.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItineraryInfoWidget extends StatelessWidget {
  const ItineraryInfoWidget(
      {Key? key, required this.price, required this.duration})
      : super(key: key);

  final price;
  final duration;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return GetBuilder<ItineraryLogic>(builder: (itinerary) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Palette.cinzaTransparente),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        UserAvatarWidget(
                          height: 60,
                          width: 60,
                          image: Image.asset(PRICE_TAG),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'R\$${price.replaceAll('.', ',')}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Preço',
                                style: TextStyle(color: Palette.cinzaClaro),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        UserAvatarWidget(
                          height: 60,
                          width: 60,
                          image: Image.asset(CLOCK),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                durationToHours(
                                  calculateTotalDurationToMinutes(
                                      home.itinerary.spotDuration),
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Duração',
                                style: TextStyle(color: Palette.cinzaClaro),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
