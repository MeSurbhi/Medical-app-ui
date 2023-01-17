import 'package:flutter/material.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui_utils.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final OutlinedBorder? shape;
  final TextStyle? style;
  final Color? color;
  final double? buttonWidth;
  final double? buttonHeight;

  const OutlinedButtonWidget(
      {Key? key,
      this.title,
      required this.onPressed,
      this.shape,
      this.style,
      this.color,
      this.buttonWidth,
      this.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(
          buttonWidth ?? UIUtils.width(context),
          buttonHeight ?? 56,
        ),
        side: BorderSide(
          width: 2.0,
          color: color ?? AppColor.primaryColor,
        ),
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Text(
        title ?? "",
        style: style ??
            Theme.of(context).textTheme.headline4!.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 17),
      ),
    );
  }
}
