import 'package:flutter/material.dart';

late Size size = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first)
    .size;

// Caution! If you think these are static values and are used to build a static UI, you mustn’t.
// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 414;
const num FIGMA_DESIGN_HEIGHT = 736;
const num FIGMA_DESIGN_STATUS_BAR = 0;

/// This method is used to get device viewport width.
double get width {
  return size.width;
}

/// This method is used to get device viewport height.
double getHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  double statusBar = mediaQuery.padding.top;
  double bottomBar = mediaQuery.padding.bottom;
  double screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

/// This method is used to set padding/margin (for the left and right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(BuildContext context, double px) {
  return ((px * width) / FIGMA_DESIGN_WIDTH);
}

/// This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(BuildContext context, double px) {
  return ((px * getHeight(context)) /
      (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));
}

/// This method is used to set the smallest px in image height and width.
double getSize(BuildContext context, double px) {
  var height = getVerticalSize(context, px);
  var width = getHorizontalSize(context, px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

/// This method is used to set text font size according to the Viewport.
double getFontSize(BuildContext context, double px) {
  return getSize(context, px);
}

/// This method is used to set padding responsively.
EdgeInsetsGeometry getPadding(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    context,
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

/// This method is used to set margin responsively.
EdgeInsetsGeometry getMargin(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    context,
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

/// This method is used to get padding or margin responsively.
EdgeInsetsGeometry getMarginOrPadding(
  BuildContext context, {
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(context, left ?? 0),
    top: getVerticalSize(context, top ?? 0),
    right: getHorizontalSize(context, right ?? 0),
    bottom: getVerticalSize(context, bottom ?? 0),
  );
}
