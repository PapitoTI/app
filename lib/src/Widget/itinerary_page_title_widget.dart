import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItineraryPageTitleWidget extends StatelessWidget {
  const ItineraryPageTitleWidget(
      {Key? key,
      required this.title,
      required this.category,
      required this.duration})
      : super(key: key);

  final String title;
  final String category;
  final duration;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.cinzaTransparente),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${duration.substring(0, 2).replaceAll(new RegExp(r'^0+(?=.)'), '')}h de duração prevista',
                          style: TextStyle(color: Palette.cinzaClaro),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Palette.cinzaClaro),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(category),
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
