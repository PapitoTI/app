import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleCardPWidget extends StatelessWidget {
  const ScheduleCardPWidget(
      {Key? key, this.image, this.title, this.description, this.info})
      : super(key: key);

  final image;
  final title;
  final description;
  final info;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      var img = home.session.getImage(image);
      return Container(
        width: 300,
        height: 84,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.cinzaTransparente),
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
                    image:
                        DecorationImage(image: img.image, fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        description,
                        style:
                            TextStyle(fontSize: 12, color: Palette.cinzaClaro),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Text(
                        '',
                        style: TextStyle(color: Palette.cinzaClaro),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
