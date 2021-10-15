import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.18)),
          child: IconButton(
              alignment: Alignment.center,
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Palette.branco,
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Palette.branco, fontSize: 24),
        )
      ],
    );
  }
}
