import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

class CardGWidget extends StatelessWidget {
  const CardGWidget(
      {Key? key,
      required this.spotName,
      required this.spotAddress,
      required this.spotImagesList,
      this.isFavorite})
      : super(key: key);

  final spotName;
  final spotAddress;
  final spotImagesList;
  final isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 275,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(spotImagesList), fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Palette.cinzaClaroTransparente,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.beach_access),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Palette.branco, Palette.cinzaClaro])),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              spotName,
                              style:
                                  TextStyle(fontSize: 18, color: Palette.preto),
                            ),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                                color: Palette.cinzaClaro,
                              ),
                              Text(
                                spotAddress,
                                style: TextStyle(
                                    fontSize: 14, color: Palette.cinzaClaro),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('2km',
                                    style:
                                        TextStyle(color: Palette.cinzaClaro)),
                                ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Palette.branco),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color:
                                                        Palette.cinzaClaro)))),
                                    child: Text(
                                      'Detalhes',
                                      style:
                                          TextStyle(color: Palette.cinzaClaro),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
