import 'package:flutter/material.dart';
import 'package:responsive_ui/screens/home_page.dart';

class TextHoverWidget extends StatefulWidget {
  final String text;
  const TextHoverWidget({super.key, required this.text});

  @override
  State<TextHoverWidget> createState() => _TextHoverWidgetState();
}

class _TextHoverWidgetState extends State<TextHoverWidget> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    double fontSize = width >= height ? width * 0.015 : height * 0.015;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        opaque: false,
        onEnter: (event) {
          setState(() {
            hover = true;
          });
        },
        onExit: (event) {
          setState(() {
            hover = false;
          });
        },
        child: Text(
          widget.text,
          style: TextStyle(
            color: hover ? Colors.red : Colors.blueGrey,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
