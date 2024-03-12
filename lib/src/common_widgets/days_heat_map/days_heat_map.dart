import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Heat Map"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeatMap(
              datasets: {
                DateTime(2024, 3, 13): 1,
                DateTime(2024, 3, 14): 2,
                DateTime(2024, 3, 15): 3,
                DateTime(2024, 3, 16): 4,
                DateTime(2024, 3, 17): 5,
                DateTime(2024, 3, 18): 6,
                DateTime(2024, 3, 19): 7,
                DateTime(2024, 3, 20): 8,
                DateTime(2024, 3, 21): 9,
                DateTime(2024, 3, 22): 10,
              },
              startDate: DateTime.now(),
              endDate: DateTime.now().add(Duration(days: 30)),
              size: 40,
              colorMode: ColorMode.opacity,
              showText: false,
              scrollable: true,
              colorsets: {
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
            ),
            HeatMapCalendar(
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
          ],
        ),
      ),
    );
  }
}
