import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

class SpotPageTitleWidget extends StatelessWidget {
  const SpotPageTitleWidget(
      {Key? key, required this.title, required this.categoria})
      : super(key: key);
  final String title;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Palette.cinza),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'título',
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
                child: Text('Categoria'),
              )),
            )
          ],
        ),
      ),
    );
  }
}
