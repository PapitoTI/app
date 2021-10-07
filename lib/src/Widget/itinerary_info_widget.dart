import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItineraryInfoWidget extends StatelessWidget {
  const ItineraryInfoWidget({Key? key, required this.price}) : super(key: key);

  final price;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.cinzaTransparente),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  UserAvatarWidget(
                    height: 80,
                    width: 80,
                    image: Image.asset('assets/images/SP.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'R\$$price',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Preço',
                          style: TextStyle(color: Palette.cinzaClaro),
                        )
                      ],
                    ),
                  ),
                  UserAvatarWidget(
                    height: 80,
                    width: 80,
                    image: Image.asset('assets/images/SP.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Três',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Destinos',
                          style: TextStyle(color: Palette.cinzaClaro),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
