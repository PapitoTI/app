import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatefulWidget {
  TimelineWidget(
      {Key? key, this.image, this.title, this.duration, this.category})
      : super(key: key);

  final image;
  final title;
  final duration;
  final category;

  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  final TimelineController _controller = Get.put(TimelineController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Palette.cinzaTransparente,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Linha do Tempo',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Obx(() {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (ctx, index) {
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            // child: UserAvatarWidget(
                                            //   height: 70,
                                            //   width: 70,
                                            //   image: 'image',
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GetBuilder<TimelineController>(
                                              builder: (timeline) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('titulo'),
                                                Text('horário'),
                                                Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      'https://via.placeholder.com/100',
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      });
                }),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Align(
                //         alignment: Alignment.topRight,
                //         child: ElevatedButton(
                //             onPressed: (() =>
                //                 {_controller.timelineNameDB.removeLast()}),
                //             child: Text('Remover local'))),
                //     Align(
                //         alignment: Alignment.topRight,
                //         child: ElevatedButton(
                //             onPressed: (() =>
                //                 {_controller.timelineNameDB.add('Local')}),
                //             child: Text('Adicionar local'))),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// class TimelineController extends GetxController {
//   var timelineNameDB = ["Local 1", "Local 2"].obs;
//   var timelineImagesDB = [
//     'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg',
//     'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg'
//   ].obs;
//   var timelinePrevisionDB = [].obs;
// }

class TimelineController extends GetxController {
  List<SpotModel> spotsList = [];

  void insertSpotsList(List<SpotModel> list) {
    spotsList = list;
    update();
  }
}
