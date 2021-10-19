import 'package:app/src/Config/palette.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
        ),
        child: Center(
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [BackButtonWidget(title: "Wallet")],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 310,
                width: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ganhos",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "6000,00 reais",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 220,
                      width: 340,
                      child: LineChart(LineChartData(
                        minX: 01,
                        maxX: 4,
                        minY: 0,
                        maxY: 3000,
                        titlesData: LineTitles.getTitleData(),
                        gridData: FlGridData(
                            show: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                  color: Palette.branco, strokeWidth: 1);
                            },
                            drawVerticalLine: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                              spots: [
                                FlSpot(1, 1550),
                                FlSpot(2, 2600),
                                FlSpot(3, 1800),
                                FlSpot(3.7, 2450),
                              ],
                              isCurved: true,
                              barWidth: 5,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.3))
                                    .toList(),
                              )),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JUL';
              case 2:
                return 'AGO';
              case 3:
                return 'SET';
              case 4:
                return 'OUT';
            }
            return '';
          },
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '2k';
              case 2:
                return '3k';
              case 3:
                return '5k';
              case 4:
                return '6k';
            }
            return '';
          },
        ),
        topTitles: SideTitles(
          showTitles: false,
        ),
      );
}
