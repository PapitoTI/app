import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

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
                  Text(
                    title,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'duration',
                    style: TextStyle(color: Palette.cinzaClaro),
                  )
                ],
              ),
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
