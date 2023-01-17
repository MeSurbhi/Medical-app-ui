import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/system_theme.dart';

class AppText extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? pLeft;
  final double? pRight;
  final double? pTop;
  final double? pBottom;
  final double? mLeft;
  final double? mRight;
  final double? mTop;
  final double? mBottom;
  final TextAlign? textAlign;
  final String? font;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final bool? strike;
  final FontStyle? fontStyle;
  final int? maxLine;
  final double? height;
  final bool setColorNull;

  const AppText({
    Key? key,
    required this.title,
    this.textColor,
    this.pLeft = 0,
    this.pRight = 0,
    this.pTop = 0,
    this.pBottom = 0,
    this.mLeft = 0,
    this.mRight = 0,
    this.mTop = 0,
    this.mBottom = 0,
    this.textAlign,
    this.font,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.textDecoration = TextDecoration.none,
    this.letterSpacing = 0,
    this.textOverflow = TextOverflow.clip,
    this.strike = false,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    this.height,
    this.setColorNull = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.fromLTRB(pLeft!, pTop!, pRight!, pBottom!),
      margin: EdgeInsets.fromLTRB(mLeft!, mTop!, mRight!, mBottom!),
      child: Text(
        title,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: textOverflow,
        style: TextStyle(
          color: setColorNull ? null : textColor ?? AppColor.white,
          letterSpacing: letterSpacing,
          fontSize: SystemTheme.scale(fontSize!),
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: font,
        ),
      ),
    );
  }
}
