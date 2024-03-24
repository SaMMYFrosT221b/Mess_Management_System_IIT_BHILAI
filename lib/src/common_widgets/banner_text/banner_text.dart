import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerText extends StatefulWidget {
  BannerText({super.key, required this.title, required this.subtitle});

  final String title;
  final List<String> subtitle;

  @override
  State<BannerText> createState() => _BannerTextState();
}

class _BannerTextState extends State<BannerText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ...widget.subtitle
              .map((text) => Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.burger)),
                      Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("₹49.99")
                    ],
                  ))
              .toList(),
        ],
      ),
    );
  }
}
