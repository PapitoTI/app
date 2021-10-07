import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPWidget extends StatelessWidget {
  const CardPWidget(
      {Key? key, required this.image, this.title, this.description, this.info})
      : super(key: key);

  final String image;
  final title;
  final description;
  final info;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      print(image);
      return Container(
        width: 350,
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
                child: home.session.getImage(image),
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '2km',
                        style: TextStyle(color: Palette.cinzaClaro),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
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
      );
    });
  }
}
