import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/common_widgets/appbar/appbar.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'dart:async';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Appbar
                MessAppBar(
                  showBackArrow: false,
                  title: Text("Shops"),
                ),
                //   Shop Categories
                MessCardHorizontal(
                    imagePath: messJuiceCorner,
                    title: "Juice Corner",
                    subtitle: "Fresh Flavors, Morning Zest"),
                MessCardHorizontal(
                    imagePath: messPizzaShop,
                    title: "Slice of Heaven",
                    subtitle: "Where Every Slice is a Delight"),
                MessCardHorizontal(
                    imagePath: messAmulShop,
                    title: "Dairy Delights",
                    subtitle: "Indulge in the Creaminess"),
                SizedBox(
                  height: 10,
                ),
                // Text("Students Left"),
                // // LineChartSample(),
                // SizedBox(
                //   height: 20,
                // ),
                // Text("Sample chart 2"),
                // LineChartSample2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MessCardHorizontal extends StatelessWidget {
  const MessCardHorizontal({
    super.key,
    required this.imagePath, // Add an imagePath parameter for the image
    required this.title, // Add a title parameter
    required this.subtitle, // Add a subtitle parameter
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity * 0.8,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFA8CD9F),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image on the left side
              Image.asset(
                imagePath,
                width: 155, // Half of the container width
                fit: BoxFit.cover,
              ),
              // Shop title and subtitle on the right side
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample extends StatefulWidget {
  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  List<FlSpot> spots = [
    FlSpot(0, 400),
    FlSpot(1, 394),
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        addRandomData();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void addRandomData() {
    final random = Random();
    if (spots.last.y == 0) {
      _timer?.cancel();
      return;
    }

    // Ensure the new value is less than the last value in the list
    double lastValue = spots.last.y;
    double newValue = lastValue - random.nextDouble() * 20;

    // Ensure the new value is not less than 0
    newValue = max(0, newValue);

    // Add a new spot to the existing spots
    spots.add(FlSpot(spots.length.toDouble(), newValue));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                    axisNameWidget: Text("Time"),
                    axisNameSize: 16,
                    drawBelowEverything: false,
                    sideTitles: SideTitles(
                      showTitles: true,
                    )),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 2,
                  belowBarData: BarAreaData(show: false),
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: [
                    FlSpot(0, 400),
                    FlSpot(1, 370),
                    FlSpot(2, 320),
                    FlSpot(3, 290),
                    FlSpot(4, 250),
                    FlSpot(5, 230),
                    FlSpot(6, 160),
                    FlSpot(7, 100),
                    FlSpot(8, 70),
                    FlSpot(9, 40),
                    FlSpot(10, 30),
                    FlSpot(11, 20),
                    FlSpot(12, 10),
                    FlSpot(13, 0),
                  ],
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 2,
                  belowBarData: BarAreaData(show: false),
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 3.5),
                FlSpot(5, 4.5),
                FlSpot(6, 3.5),
                FlSpot(7, 5),
                FlSpot(8, 4),
                FlSpot(9, 6),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(1, 4),
                FlSpot(2, 3),
                FlSpot(3, 6),
                FlSpot(4, 4.5),
                FlSpot(5, 5.5),
                FlSpot(6, 4.5),
                FlSpot(7, 6),
                FlSpot(8, 5),
                FlSpot(9, 7),
              ],
              isCurved: true,
              color: Colors.red,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
