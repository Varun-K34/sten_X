import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray70075 = fromHex('#75454163');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray400 = fromHex('#8b8a8a');

  static Color blueGray10066 = fromHex('#66d9d9d9');

  static Color gray900 = fromHex('#141034');

  static Color blueA100 = fromHex('#7aa1ff');

  static Color gray9006c = fromHex('#6c141034');

  static Color black9003f = fromHex('#3f000000');

  static Color gray100 = fromHex('#f6f6f6');

  static Color black900 = fromHex('#000000');

  static Color gray9007e = fromHex('#7e141034');

  static Color blue100 = fromHex('#c4cdff');

  static Color blue200 = fromHex('#aab7ff');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray70033 = fromHex('#336a6767');

  static Color blue500 = Color(0xFF2196F3);

  static Color blue101 = Color(0xFFE3F2FD);

  static Color blue900 = Color(0xFF0D47A1);

  static Color blue901 = fromHex('#141034'); // Primary dark color

  static Color blueGray102 = Color(0xFFCFD8DC);

  static const Color blue103 = Color(0xFFABCDEF);

  static Color darkModeBackground =
      Color(0xFF121212); // Dark mode background color

  static Color darkModeSurface = Color(0xFF1E1E1E);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
