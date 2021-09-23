import 'package:app/src/Config/palette.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddSpotsPage extends StatefulWidget {
  @override
  _AddSpotsPageState createState() => _AddSpotsPageState();
}

class _AddSpotsPageState extends State<AddSpotsPage> {
  final logic = Get.put(AddSpotsLogic());

  @override
  Widget build(BuildContext context) {
    String spotName;
    String spotAddress;
    String spotCategory;
    String spotDescription;
    List<String> spotImagesList;
    bool spotIsFavorite;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(text: 'Nome do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotName = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Endereço do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotName = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Categoria do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotName = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Descrição do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotName = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Adicione fotos do destino:'),
              Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AddSpotsLogic>();
    super.dispose();
  }
}
