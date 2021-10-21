import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineSelf extends StatefulWidget {
  const TimelineSelf(this.imageList, this.textList);
  final List<String> imageList;
  final List<String> textList;

  @override
  _TimelineSelfState createState() =>
      _TimelineSelfState(this.imageList, this.textList);
}

class _TimelineSelfState extends State<TimelineSelf> {
  _TimelineSelfState(this.imageList, this.textList);
  final List<String> imageList;
  final List<String> textList;
  Widget pato(String imagem, String texto) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(width: 15),
      beforeLineStyle: const LineStyle(
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // child: UserAvatarWidget(
                      //   height: 70,
                      //   width: 70,
                      //   image: ,
                      // ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(texto),
                        Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Icon(FontAwesomeIcons.check)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palette.cinzaTransparente,
        ),
        child: Column(
            children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Check-points',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),

                  //
                  // "Stand-up poético",
                  //"Sarau das editoras",
                  //Stand-up poético"
                ] +
                pato2()));
  }

  List<Widget> pato2() {
    var listWidget = <Widget>[];
    for (var i = 0; i < imageList.length; i++) {
      listWidget.add(pato(imageList[i], textList[i]));
    }
    return listWidget;
  }
}
