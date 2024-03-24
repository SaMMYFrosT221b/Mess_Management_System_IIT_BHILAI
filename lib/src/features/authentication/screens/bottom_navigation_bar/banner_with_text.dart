import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:mess_management_system/src/common_widgets/banner_text/banner_text.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  List<Color> cardColors = [
    Color(0xFFFFA07A), // Breakfast - Soft Orange
    Color(0xFF90EE90), // Lunch - Calm Green
    Color(0xFFDDA0DD), // Snacks - Playful Purple
    Color(0xFFCD5C5C), // Dinner - Warm Red
  ];
  final List<Widget> textList = [
    SingleChildScrollView(
      child: Container(
        child: BannerText(
          title: "Breakfast",
          subtitle: [
            "Poha",
            "Tea",
            "Curd",
            "Milk",
            "Cornflakes",
          ],
        ),
      ),
    ),
    SingleChildScrollView(
      child: Container(
          child: BannerText(
              title: "Lunch",
              subtitle: ["Poha", "Tea", "Curd", "Milk", "Corflakes"])),
    ),
    SingleChildScrollView(
      child: Container(
          child: BannerText(
              title: "Snacks",
              subtitle: ["Poha", "Tea", "Curd", "Milk", "Corflakes"])),
    ),
    SingleChildScrollView(
      child: Container(
        child: BannerText(
          title: "Dinner",
          subtitle: ["Poha", "Tea", "Curd", "Milk", "Corflakes"],
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: textList.asMap().entries.map((entry) {
              int index = entry.key;
              Widget widget = entry.value;

              return Card(
                elevation: 5,
                color: cardColors[
                    index % cardColors.length], // Apply color based on index
                child: Container(
                  width: screenWidth * 0.8, // 80% of the screen width
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: widget,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: textList.map((widget) {
              int index = textList.indexOf(widget);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
