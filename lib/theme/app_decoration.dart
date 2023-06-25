import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBluegray70075 => BoxDecoration(
        color: ColorConstant.blueGray70075,
      );
  static BoxDecoration get fillBlue100 => BoxDecoration(
        color: ColorConstant.blue100,
      );
  static BoxDecoration get fillBlue200 => BoxDecoration(
        color: ColorConstant.blue200,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBluegray10066 => BoxDecoration(
        color: ColorConstant.blueGray10066,
      );
      

  static double getHorizontalSize(double value) {
    // Implement your SizeUtil logic here or adjust it according to your needs
    // For example:
    // return SizeUtil.getHorizontalSize(value);
    return value; // Placeholder implementation
  }
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder4 = BorderRadius.circular(
    AppDecoration.getHorizontalSize(4),
  );

  static BorderRadius roundedBorder30 = BorderRadius.circular(
    AppDecoration.getHorizontalSize(30),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
