import 'package:flutter/material.dart';
import 'package:varun_s_application20/core/app_export.dart';

class CustomButton extends StatelessWidget {
  final ButtonShape? shape;
  final ButtonPadding? padding;
  final ButtonVariant? variant;
  final ButtonFontStyle? fontStyle;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String? text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final BuildContext context;
  final Color buttonColor;

  const CustomButton({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.margin,
    this.onTap,
    this.width,
    this.height,
    this.text,
    this.prefixWidget,
    this.suffixWidget,
    required this.context,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return this.alignment != null
        ? Align(
            alignment: this.alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  Widget _buildButtonWidget() {
    return Padding(
      padding: this.margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: this.onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  Widget _buildButtonWithOrWithoutIcon() {
    if (this.prefixWidget != null || this.suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.prefixWidget ?? SizedBox(),
          Text(
            this.text!, // Added null check here
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          this.suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        this.text!, // Added null check here
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  ButtonStyle _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        this.width ?? double.maxFinite,
        this.height ?? getVerticalSize(this.context, 40),
      ),
      padding: getPadding(),
      backgroundColor: buttonColor, // Use the provided buttonColor
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  EdgeInsetsGeometry getPadding() {
    switch (this.padding) {
      case ButtonPadding.PaddingAll8:
        return EdgeInsets.all(8.0);
      case ButtonPadding.PaddingAll3:
        return EdgeInsets.all(3.0);
      default:
        return EdgeInsets.zero;
    }
  }

  Color? _setTextButtonShadowColor() {
    switch (this.variant) {
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.black9003f;
      default:
        return null;
    }
  }

  BorderRadius _setBorderRadius() {
    switch (this.shape) {
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      case ButtonShape.RoundedBorder30:
        return BorderRadius.circular(30.0);
      case ButtonShape.RoundedBorder25:
        return BorderRadius.circular(25.0);
      default:
        return BorderRadius.circular(25.0);
    }
  }

  TextStyle _setFontStyle() {
    switch (this.fontStyle) {
      case ButtonFontStyle.PoppinsBold30:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(this.context, 30),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.PoppinsSemiBold30:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(this.context, 30),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsBold20:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(this.context, 20),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(this.context, 30),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder30,
  RoundedBorder25,
}

enum ButtonPadding {
  PaddingAll8,
  PaddingAll3,
}

enum ButtonVariant {
  OutlineBlack9003f,
  FillGray900,
  FillBlueA100,
  FillBlueA500,
}

enum ButtonFontStyle {
  PoppinsBold30,
  PoppinsSemiBold30,
  PoppinsBold20,
}
