import 'package:flutter/material.dart';

class OrionButtonWidget extends StatelessWidget {
  const OrionButtonWidget({Key? key, this.text, this.icon}) : super(key: key);

  final text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ))),
        onPressed: null,
        child: Column(
          children: [
            if (text != null) Text(text),
            if (icon != null) icon,
          ],
        ));
  }
}
