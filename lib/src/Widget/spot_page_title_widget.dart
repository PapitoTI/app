import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

class SpotPageTitleWidget extends StatelessWidget {
  const SpotPageTitleWidget(
      {Key? key, required this.title, required this.category})
      : super(key: key);
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.cinzaTransparente),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 30),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
