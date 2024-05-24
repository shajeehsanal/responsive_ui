import 'package:flutter/material.dart';
import 'package:responsive_ui/screens/home_page.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: MouseRegion(
        onHover: (event) {
          hovered = true;
          setState(() {});
        },
        onExit: (event) {
          hovered = false;
          setState(() {});
        },
        cursor: MaterialStateMouseCursor.clickable,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                hovered ? Colors.red : const Color.fromARGB(255, 224, 92, 90),
          ),
          duration: const Duration(milliseconds: 300),
          width: width * 0.05,
          height: height * 0.1,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
