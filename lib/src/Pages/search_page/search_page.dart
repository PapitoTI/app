import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/destiny_model.dart';
import 'package:app/src/Pages/spot/view.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:flutter/material.dart';

class SearchPageDelegate extends SearchDelegate<Destiny> {
  final List<Destiny> destiny;

  List<Destiny> _filter = [];

  SearchPageDelegate(this.destiny);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, const Destiny('', '', ''));
        },
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Ceu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
      ),
      child: ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
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
                                _filter[index].image,
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
                                _filter[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                _filter[index].description,
                                style: TextStyle(
                                    fontSize: 12, color: Palette.cinzaClaro),
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
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '2km',
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
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = destiny.where((destiny) {
      return destiny.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Ceu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
      ),
      child: ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
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
                                _filter[index].image,
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
                                _filter[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                _filter[index].description,
                                style: TextStyle(
                                    fontSize: 12, color: Palette.cinzaClaro),
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
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '2km',
                                style: TextStyle(color: Palette.cinzaClaro),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () => SpotPage(),
                                child: OrionButtonWidget(
                                    icon: Icon(
                                  Icons.arrow_forward,
                                  color: Palette.branco,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        hintColor: Palette.branco,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0D1D)));
  }
}
