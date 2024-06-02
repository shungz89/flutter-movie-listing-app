import 'package:flutter/material.dart';

class AppColors {
  static const Color lightGreyLighter = Color(0xFFF3F5F7);
  static const Color lightGreyLight = Color(0xFFE7ECEE);
  static const Color lightGrey = Color(0xFFCFD9DE);
  static const Color lightGreyDark = Color(0xFFABBCC4);
  static const Color lightGreyDarker = Color(0xFF93A9B4);

  static const Color darkGreyLighter = Color(0xFF6F8C9B);
  static const Color darkGrey = Color(0xFF4B616C);
  static const Color darkGreyDark = Color(0xFF35454D);
  static const Color darkGreyDarker = Color(0xFF212B30);

  static const Color rankingColor1 = Color(0xFF5CD66C);
  static const Color rankingColor2 = Color(0xFF2E8FEF);
  static const Color rankingColor3 = Color(0xFFF7EB83);
  static const Color rankingColorR = Color(0xFFCF283E);
  static const Color rankingColor5 = Color(0xFF673AB7);
  static const Color rankingColorP = Color(0xFFFFC0CB);
  //Currently Not In Use
  static const Color rankingColor4 = Color(0xFFFF9800);

  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFED9C5A);
  static const Color blue = Color(0xFF2E8FEF);
  static const Color primaryBlue = Color(0xFF01C3F7);
  static const Color zaloBlue = Color(0xFF0068FF);
  static const Color lineGreen = Color(0xFF00B900);
  static const Color green = Color(0xFF5CD66C);
  static const Color black = Color(0xFF000000);
  static const Color pureBlack = Color(0xFF000000);

  static const Color transparent = Colors.transparent;

  static const Color calendarDisabledColor = Color(0xFF4F4F4F);
  static const Color transparentWhite50 = Color(0x32FFFFFF);
  static const Color transparentBlack80 = Color(0xCC000000);
  static const Color transparentBlack50 = Color(0x80000000);
  static const Color transparentBlack60 = Color(0x99000000);
  static const Color transparentBlack25 = Color(0x40000000);


  static const Color transparentdarkGreyDarker50 = Color(0xCC212B30);

  static const Color transparentOverlayVideoPlayer = Color(0x94343434);

  static const Color notificationRed = Color(0xFFFF414D);
  static const Color highlightDarkBlue = Color(0xFF0D1627);

  static const Color tableTextColor = white;

  static const Color primaryBlue80 = Color(0xCC01C3F7);
  static const Color white80 = Color(0xCCFFFFFF);

  ///Start Henry
  static const Color darkGreyLight = Color(0xFF5C7784);
  static const Color skeletonDarkGrey = Color(0xFF222C31);

  ///End Henry
  static const Color yellow = Color(0xFFFFE570);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
