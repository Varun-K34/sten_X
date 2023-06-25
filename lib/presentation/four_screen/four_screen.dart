import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';

class FourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.blue100,
        appBar: CustomAppBar(
          context: context,
          height: getVerticalSize(context, 76),
          leadingWidth: 53,
          leading: AppbarImage(
            height: getSize(context, 30),
            width: getSize(context, 30),
            imagePath: ImageConstant.imgBrightness11,
            margin: getMargin(context, left: 23, top: 13, bottom: 23),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "Synco"),
          actions: [
            Padding(
              padding: getPadding(context, right: 16),
              child: AppbarImage(
                height: getSize(context, 30),
                width: getSize(context, 30),
                imagePath: ImageConstant.imgExit11,
                onTap: () {
                  onTapExitEleven1(context);
                },
              ),
            ),
            Padding(
              padding: getPadding(context, right: 24),
              child: AppbarImage(
                height: getSize(context, 30),
                width: getSize(context, 30),
                imagePath: ImageConstant.imgBackbutton,
                onTap: () {
                  onTapBackButton1(context);
                },
              ),
            ),
          ],
          styleType: Style.bgFillGray900,
        ),
      ),
    );
  }

  void onTapBackButton1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.twoScreen);
  }

  void onTapExitEleven1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oneScreen);
  }
}
