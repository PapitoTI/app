import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
