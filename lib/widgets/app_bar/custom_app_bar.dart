import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    required this.context, // Pass the BuildContext as a parameter
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });

  final BuildContext context; // Store the BuildContext as an instance variable

  double height;
  Style? styleType;
  double? leadingWidth;
  Widget? leading;
  Widget? title;
  bool? centerTitle;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(), // Remove the parameter
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        MediaQuery.of(context).size.width,
        height,
      );

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFillGray900:
        return Container(
          height: getVerticalSize(context, 71),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.gray900,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFillGray900, bgFillGray50,
}
