import 'package:app/src/Models/favoritos_model.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState(connectionInterface);

  final TouristServerConnection connectionInterface;

  TestePage(this.connectionInterface);
}

class _TestePageState extends State<TestePage> {
  final TesteLogic logic = Get.put(TesteLogic());

  final TouristServerConnection connectionInterface;

  _TestePageState(this.connectionInterface);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/SP.jpg',
              fit: BoxFit.cover,
            ),
            Container(
                color: Colors.black.withOpacity(0.7),
                child: SafeArea(
                    child: Center(
                        child: SingleChildScrollView(
                  child: Container(
                    child: FutureBuilder(
                        future: connectionInterface.getSpots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Center(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CardPWidget(
                                          title:
                                              '${snapshot.data as List<FavoritosModel>}',
                                        ),
                                      );
                                    }));
                          }
                          return Text('teste');
                        }),
                  ),
                )))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TesteLogic>();
    super.dispose();
  }
}
