import 'package:flutter/material.dart';
import 'package:responsive_ui/common/text_hover_widget.dart';

double width = 0;
double height = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _menuIcon = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _showDrawer = false;
  double _containerHeight = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    double fontSize = width >= height ? width * 0.02 : height * 0.02;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(fontSize),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: height * 0.2),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.shade700.withOpacity(0.5),
                      BlendMode.srcOver,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'BEST PLACE TO FIND AND EXPLORE',
                            style: TextStyle(
                              fontSize: fontSize * 2,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'THAT ALL YOU NEED',
                            style: TextStyle(
                              fontSize: fontSize * 2,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Find Best Place, Restaurant, Hotel, Real State and many more think in just One click',
                            style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1)
                          .copyWith(top: 20),
                      child: width <= 800
                          ? Column(
                              children: searchFields(fontSize),
                            )
                          : Row(
                              children: searchFields(fontSize),
                            ),
                    )
                  ],
                ),
              ),
              AnimatedContainer(
                color: Colors.white,
                duration: const Duration(milliseconds: 300),
                height: _containerHeight,
                width: width,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHoverWidget(text: 'HOME'),
                          TextHoverWidget(text: 'HOW IT WORKS'),
                          TextHoverWidget(text: 'EXPLORE'),
                          TextHoverWidget(text: 'REVIEW'),
                          TextHoverWidget(text: 'BLOG'),
                          TextHoverWidget(text: 'CONTACT'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> searchFields(double fontSize) {
    return [
      if (width <= 800)
        objectSearchField(fontSize)
      else
        Expanded(
          child: objectSearchField(fontSize),
        ),
      const SizedBox(height: 8),
      if (width <= 800)
        locationSearchField(fontSize)
      else
        Expanded(
          child: locationSearchField(fontSize),
        ),
    ];
  }

  Container locationSearchField(double fontSize) {
    return Container(
      color: width <= 800 ? Colors.white : null,
      child: Column(
        children: [
          if (width <= 800)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Location',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize * 0.9,
                ),
              ),
            ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: width <= 800
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize * 0.9,
                        ),
                      ),
                    ),
              suffixIcon: const Icon(Icons.gps_fixed),
              labelText: 'Ex: London, New York, Rome',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: fontSize * 0.7,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              border: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              errorBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              enabledBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              focusedBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              disabledBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              focusedErrorBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Container objectSearchField(double fontSize) {
    return Container(
      color: width <= 800 ? Colors.white : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (width <= 800)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'What?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize * 0.9,
                ),
              ),
            ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: width <= 800
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'What?',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize * 0.9,
                        ),
                      ),
                    ),
              suffixIcon: const Icon(Icons.list),
              labelText: 'Ex: Place, Restaurant, Food, Automobile',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: fontSize * 0.7,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              border: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              errorBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              enabledBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              focusedBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              disabledBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              focusedErrorBorder: width <= 800
                  ? null
                  : OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10).copyWith(
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(double fontSize) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: width < height,
      leading: width <= 800
          ? Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0),
              child: MouseRegion(
                cursor: MaterialStateMouseCursor.clickable,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _showDrawer = !_showDrawer;
                    if (_showDrawer) {
                      _containerHeight = height * 0.5;
                    } else {
                      _containerHeight = 0;
                    }
                    setState(() {
                      _menuIcon = !_menuIcon;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _menuIcon ? Icons.menu : Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: RichText(
        text: TextSpan(
          children: const [
            TextSpan(text: 'List'),
            TextSpan(
              text: 'Race',
              style: TextStyle(color: Colors.red),
            ),
          ],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ),
      actions: width > 800
          ? const [
              TextHoverWidget(text: 'HOME'),
              TextHoverWidget(text: 'HOW IT WORKS'),
              TextHoverWidget(text: 'EXPLORE'),
              TextHoverWidget(text: 'REVIEW'),
              TextHoverWidget(text: 'BLOG'),
              TextHoverWidget(text: 'CONTACT'),
            ]
          : null,
    );
  }
}
