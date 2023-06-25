import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: getHorizontalSize(context, 375),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          context,
                          left: 20,
                          top: 10,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          "App Navigation",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtRobotoRegular20,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(context, left: 20),
                        child: Text(
                          "Check your app's UI from the below demo screens of your app.",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtRobotoRegular16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(context, top: 5),
                      child: Divider(
                        height: getVerticalSize(context, 1),
                        thickness: getVerticalSize(context, 1),
                        color: ColorConstant.black900,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillWhiteA700,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTapOne(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      context,
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      "One",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtRobotoRegular20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(context, top: 5),
                                  child: Divider(
                                    height: getVerticalSize(context, 1),
                                    thickness: getVerticalSize(context, 1),
                                    color: ColorConstant.blueGray40001,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapTwo(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      context,
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      "Two",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtRobotoRegular20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(context, top: 5),
                                  child: Divider(
                                    height: getVerticalSize(context, 1),
                                    thickness: getVerticalSize(context, 1),
                                    color: ColorConstant.blueGray40001,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapThre(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      context,
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      "Three",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtRobotoRegular20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(context, top: 5),
                                  child: Divider(
                                    height: getVerticalSize(context, 1),
                                    thickness: getVerticalSize(context, 1),
                                    color: ColorConstant.blueGray40001,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapFour(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      context,
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      "Four",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtRobotoRegular20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(context, top: 5),
                                  child: Divider(
                                    height: getVerticalSize(context, 1),
                                    thickness: getVerticalSize(context, 1),
                                    color: ColorConstant.blueGray40001,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oneScreen);
  }

  onTapTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.twoScreen);
  }

  onTapThre(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.threScreen);
  }

  onTapFour(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fourScreen);
  }
}
