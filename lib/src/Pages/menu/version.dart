import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';

class Version extends StatefulWidget {
  const Version({Key? key}) : super(key: key);

  @override
  _VersionState createState() => _VersionState();
}

class _VersionState extends State<Version> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Ceu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [BackButtonWidget(title: "Reports")],
            ),
          ),
          Center(
            child: Text("Version: 1.0.1"),
          )
        ],
      )),
    ));
  }
}
