import 'package:app/src/Widget/pesquisa.dart';
import 'package:flutter/material.dart';

class HomeTurista extends StatefulWidget {
  @override
  _HomeTuristaState createState() => _HomeTuristaState();
}

class _HomeTuristaState extends State<HomeTurista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "asset/SP.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black.withOpacity(0.8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 175,
                ),
                Row(
                  children: [
                    Text(
                      'Boa tarde, XXXXXXXX!',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                pesquisar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
