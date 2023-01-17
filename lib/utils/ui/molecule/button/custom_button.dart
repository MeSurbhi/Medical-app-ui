import 'package:flutter/material.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui_utils.dart';

class AppSecondaryButton extends StatelessWidget {
  final bool? busy;
  final String? label;
  final String? icon;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final String? fontFamily;
  final double? borderRadius;
  final Color? borderSideColor;
  final double? borderSideWidth;
  final bool? autofocus;
  final double? letterSpacing;
  final FontWeight? weight;

  const AppSecondaryButton(
      {this.busy: false,
      @required this.label,
      this.icon,
      this.onTap,
      this.textColor,
      this.backgroundColor,
      this.width,
      this.height: 56,
      this.fontSize: 16,
      this.fontFamily,
      this.autofocus: false,
      this.borderRadius: 18,
      this.borderSideColor: AppColor.white,
      this.borderSideWidth: 1,
      this.letterSpacing: 1,
      this.weight: FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColor.primaryColor.withAlpha(60),
          blurRadius: 10.0,
          spreadRadius: 0.0,
        ),
      ]),
      child: ElevatedButton(
          autofocus: autofocus!,
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            shadowColor: MaterialStateProperty.all<Color>(
              AppColor.primaryColor.withOpacity(0.32),
            ),
            minimumSize: MaterialStateProperty.resolveWith<Size>(
              (Set<MaterialState> states) {
                return Size(UIUtils.width(context), height!); // Use the component's default.
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : BorderRadius.zero,
                    side: borderSideWidth != null && borderSideColor != null
                        ? BorderSide(
                            width: borderSideWidth!,
                            color: Colors.transparent,
                          )
                        : BorderSide.none)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColor.primaryColor;
                }
                if (states.contains(MaterialState.focused)) {
                  return AppColor.primaryColor;
                }
                if (states.contains(MaterialState.hovered)) {
                  return AppColor.primaryColor;
                }
                if (states.contains(MaterialState.pressed)) {
                  return AppColor.primaryColor;
                }

                return AppColor.primaryColor; // Use the component's default.
              },
            ),
          ),
          child: Text(
            label!,
            style: TextStyle(
              fontWeight: weight,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily ?? 'Montserrat',
              color:
                  textColor ?? ((onTap != null) ? textColor : AppColor.white),
            ),
          )),
    );
  }
}
