import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget2 extends StatefulWidget {
  TimelineWidget2({Key? key}) : super(key: key);

  @override
  _TimelineWidget2State createState() => _TimelineWidget2State();
}

class _TimelineWidget2State extends State<TimelineWidget2> {
  final TimelineController _controller = Get.put(TimelineController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Palette.cinzaClaroTransparente,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Obx(() {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _controller.timelineNameDB.length,
                      itemBuilder: (ctx, index) {
                        return TimelineTile(
                          indicatorStyle: IndicatorStyle(width: 15),
                          beforeLineStyle: const LineStyle(
                            thickness: 2,
                          ),
                          endChild: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TimelineField()),
                        );
                      });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: (() =>
                                {_controller.timelineNameDB.removeLast()}),
                            child: Text('Remover local'))),
                    Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: (() =>
                                {_controller.timelineNameDB.add('Local')}),
                            child: Text('Adicionar local'))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineField extends StatelessWidget {
  const TimelineField({Key? key, this.img}) : super(key: key);

  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://via.placeholder.com/100',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
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
                    Text('Nome'),
                    Text('horário'),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://via.placeholder.com/100',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimelineController extends GetxController {
  var timelineNameDB = ["Local 1", "Local 2"].obs;
  var timelineImagesDB = [
    'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg'
  ].obs;
  var timelinePrevisionDB = [].obs;
}
