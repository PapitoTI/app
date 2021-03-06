import 'package:app/src/Config/palette.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:flutter/material.dart';

class TouristScheduleCardPWidget extends StatelessWidget {
  const TouristScheduleCardPWidget(
      {Key? key,
      this.image,
      this.title,
      this.description,
      this.info,
      this.date})
      : super(key: key);

  final image;
  final title;
  final description;
  final info;
  final date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.cinzaTransparente),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  )),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16),
                    ),
                    if (description == 'ScheduleStatus.approved')
                      Text(
                        'Aprovado',
                        style:
                            TextStyle(fontSize: 12, color: Palette.cinzaClaro),
                      ),
                    if (description == 'ScheduleStatus.pending')
                      Text(
                        'Aguardando aprova????o',
                        style:
                            TextStyle(fontSize: 12, color: Palette.cinzaClaro),
                      ),
                    if (description == 'ScheduleStatus.denied')
                      Text(
                        'Recusado',
                        style:
                            TextStyle(fontSize: 12, color: Palette.cinzaClaro),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Text(
                      date,
                      style: TextStyle(color: Palette.cinzaClaro),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OrionButtonWidget(
                        icon: Icon(
                      Icons.arrow_forward,
                      color: Palette.branco,
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
