// import 'package:app/src/Config/palette.dart';
// import 'package:app/src/Pages/itinerary/logic.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timeline_tile/timeline_tile.dart';
//
// import '../user_avatar_widget.dart';
// import 'logic.dart';
//
// class EditableTimelineWidgetPage extends StatefulWidget {
//   @override
//   _EditableTimelineWidgetPageState createState() =>
//       _EditableTimelineWidgetPageState();
// }
//
// class _EditableTimelineWidgetPageState
//     extends State<EditableTimelineWidgetPage> {
//   final logic = Get.put(EditableTimelineWidgetLogic());
//
//   @override
//   Widget build(BuildContext context) {
//     _selectedTime = logic.itinerary.spotDuration.obs;
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//                 color: Palette.cinzaTransparente,
//                 borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Linha do Tempo',
//                     style: TextStyle(fontSize: 22),
//                   ),
//                 ),
//                 GetBuilder<ItineraryLogic>(builder: (logic) {
//                   List<TimeOfDay> itineraryDuration =
//                       logic.itinerary.spotDuration;
//                   return GetBuilder<EditableTimelineWidgetLogic>(
//                       builder: (timeline) {
//                     return ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: logic.itinerary.spotsList.length,
//                         itemBuilder: (ctx, index) {
//                           return TimelineTile(
//                             indicatorStyle: IndicatorStyle(width: 15),
//                             beforeLineStyle: const LineStyle(
//                               thickness: 2,
//                             ),
//                             endChild: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   child: Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                               child: UserAvatarWidget(
//                                                 height: 70,
//                                                 width: 70,
//                                                 image: logic
//                                                     .itinerary
//                                                     .spotsList[index]
//                                                     .spotImagesList[0],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Flexible(
//                                                   child: Column(
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .only(
//                                                                 left: 8.0),
//                                                         child: Text(logic
//                                                             .itinerary
//                                                             .spotsList[index]
//                                                             .name),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Flexible(
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                         color: Palette.cinza,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20)),
//                                                     child: Column(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(8.0),
//                                                           child:
//                                                               GestureDetector(
//                                                             onTap: (() =>
//                                                                 {_show(index)}),
//                                                             child: Text(
//                                                                 _selectedTime[
//                                                                         index]
//                                                                     .format(
//                                                                         context)),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   height: 35,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       color:
//                                                           Palette.cinzaClaro),
//                                                   child: Center(
//                                                       child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Row(
//                                                       children: [
//                                                         Text(logic
//                                                             .itinerary
//                                                             .spotsList[index]
//                                                             .category),
//                                                       ],
//                                                     ),
//                                                   )),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )),
//                           );
//                         });
//                   });
//                 })
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   children: [
//                 //     Align(
//                 //         alignment: Alignment.topRight,
//                 //         child: ElevatedButton(
//                 //             onPressed: (() =>
//                 //                 {_controller.timelineNameDB.removeLast()}),
//                 //             child: Text('Remover local'))),
//                 //     Align(
//                 //         alignment: Alignment.topRight,
//                 //         child: ElevatedButton(
//                 //             onPressed: (() =>
//                 //                 {_controller.timelineNameDB.add('Local')}),
//                 //             child: Text('Adicionar local'))),
//                 //   ],
//                 // )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     Get.delete<EditableTimelineWidgetLogic>();
//     super.dispose();
//   }
// }
