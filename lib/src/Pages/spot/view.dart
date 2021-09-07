import 'package:app/src/Widget/description_widget.dart';
import 'package:app/src/Widget/spot_images_slider_widget.dart';
import 'package:app/src/Widget/spot_page_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SpotPage extends StatefulWidget {
  @override
  _SpotPageState createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  final SpotLogic logic = Get.put(SpotLogic());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  SpotPageTitleWidget(title: 'title', categoria: 'categoria'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: DescriptionWidget(),
            ),
            SpotImagesSlider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Conheça este destino',
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: null,
                      child: Row(
                        children: [
                          Icon(Icons.attach_money),
                          Text('Roteiro'),
                        ],
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: null,
                      child: Row(
                        children: [
                          Icon(Icons.attach_money),
                          Text('Guia'),
                        ],
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: null,
                      child: Row(
                        children: [
                          Icon(Icons.attach_money),
                          Text('Anfitrião'),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    Get.delete<SpotLogic>();
    super.dispose();
  }
}
