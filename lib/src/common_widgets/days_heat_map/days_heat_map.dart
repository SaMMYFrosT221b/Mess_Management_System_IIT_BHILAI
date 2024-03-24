import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // specify the width
      child: HeatMapCalendar(
        initDate: DateTime.now(),
        defaultColor: Colors.white,
        flexible: true,
        colorMode: ColorMode.color,
        datasets: {
          DateTime(2024, 3, 21): 3,
          DateTime(2024, 3, 22): 7,
          DateTime(2024, 3, 23): 10,
          DateTime(2024, 3, 24): 13,
          DateTime(2024, 3, 25): 6,
        },
        colorsets: const {
          1: Color.fromARGB(10, 2, 179, 8),
          2: Color.fromARGB(20, 2, 179, 8),
          3: Color.fromARGB(30, 2, 179, 8),
          4: Color.fromARGB(40, 2, 179, 8),
          5: Color.fromARGB(50, 2, 179, 8),
          6: Color.fromARGB(60, 2, 179, 8),
          7: Color.fromARGB(70, 2, 179, 8),
          8: Color.fromARGB(80, 2, 179, 8),
          9: Color.fromARGB(90, 2, 179, 8),
          10: Color.fromARGB(100, 2, 179, 8),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
