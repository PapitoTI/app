import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

Widget pesquisar() {
  return FloatingSearchBar(
    hint: 'Onde vamos ...',
    openAxisAlignment: 0.0,
    maxWidth: 600,
    axisAlignment: 0.0,
    scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
    elevation: 4.0,
    physics: BouncingScrollPhysics(),
    onQueryChanged: (query) {
      //Your methods will be here
    },
    showDrawerHamburger: false,
    transitionCurve: Curves.easeInOut,
    transitionDuration: Duration(milliseconds: 500),
    transition: CircularFloatingSearchBarTransition(),
    debounceDelay: Duration(milliseconds: 500),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('');
          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          color: Colors.white,
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text('Teste'),
                  subtitle: Text('teste'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
