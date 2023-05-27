import 'package:flutter/material.dart';

class TicTacToeColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Color get whiteGray => fromHex('#F9F9F9');
  Color get blackShadow => const Color.fromARGB(20, 0, 0, 0);
  Color get orange => fromHex('#D74D00');
  Color get gray => fromHex("#D9D9D9");
  Color get darkGray => fromHex("#B4B4B4");
}
