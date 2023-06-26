import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:varun_s_application20/core/app_export.dart';

class TwoScreen extends StatefulWidget {
  @override
  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _textAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  num getHeight(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    num statusBar = mediaQuery.padding.top;
    num bottomBar = mediaQuery.padding.bottom;
    return mediaQuery.size.height - statusBar - bottomBar;
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isDarkMode ? Colors.black : ColorConstant.blueA100;
    Color appBarIconColor = isDarkMode ? Colors.white : Colors.black;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color backgroundColor = isDarkMode ? Color(0xFF22292F) : Color(0xFFC5CEFF);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          context: context,
          height: getVerticalSize(context, 71),
          leadingWidth: 53,
          leading: IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.brightness_6,
              color: appBarIconColor,
            ),
            onPressed: toggleTheme,
            iconSize: getSize(context, 30),
            padding: getPadding(context, left: 23, top: 18, bottom: 23),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "StenX"),
          actions: [
            AppbarImage(
              height: getSize(context, 30),
              width: getSize(context, 30),
              imagePath: ImageConstant.imgExit11,
              margin:
                  getMargin(context, left: 24, top: 18, right: 24, bottom: 23),
              onTap: () {
                onTapExitEleven(context);
              },
            ),
          ],
          styleType: isDarkMode ? Style.bgFillGray900 : Style.bgFillGray900,
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(context, left: 12, right: 12),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 90,
                      left: 0,
                      child: SlideTransition(
                        position: _textAnimation,
                        child: Text(
                          "Summarize \nText Effortlessly!",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 40,
                            color: textColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      right: -10,
                      child: Lottie.asset(
                        isDarkMode
                            ? 'assets/images/wink.json'
                            : 'assets/images/wink.json',
                        repeat: false,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onTapSummarize(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(context, 61),
                      alignment: Alignment.center,
                      child: Text(
                        "Summarize",
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size here
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      onTapHistory(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(buttonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Container(
                      height: getVerticalSize(context, 61),
                      alignment: Alignment.center,
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size here
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSummarize(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.threScreen);
  }

  void onTapHistory(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fourScreen);
  }

  void onTapExitEleven(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oneScreen);
  }
}
