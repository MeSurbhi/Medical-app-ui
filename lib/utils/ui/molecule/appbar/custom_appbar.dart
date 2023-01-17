import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';
import 'package:medical_app/utils/ui_utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function()? onLeadingClick;
  final Widget? trailingWidget;
  final Color? backgroundColor;
  final double? appBarHeight;
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;
  final BuildContext context;
  final double? elevation;
  final ShapeBorder? shapeBorder;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? fontWeight;
  final Color? leadingImageColor;
  final double? trailingEndSpace;
  final Icon? leadingIcon;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.onLeadingClick,
      this.trailingWidget,
      this.backgroundColor,
      this.appBarHeight = 60,
      this.statusBarColor = AppColor.blueStatusBarColorA6AAB4,
      this.statusBarIconBrightness = Brightness.light,
      required this.context,
      this.elevation,
      this.shapeBorder,
      this.titleColor = AppColor.white,
      this.leadingImageColor,
      this.trailingEndSpace,
      this.titleFontSize = 18,
      this.fontWeight = FontWeight.w700,
      this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(onTap: onLeadingClick, child: leadingIcon),
      toolbarHeight: UIUtils.isMobile(context) ? 60 : 80,
      elevation: elevation,
      shape: shapeBorder,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      backgroundColor: backgroundColor,
      title: AppText(
          title: title,
          fontSize: titleFontSize,
          fontWeight: fontWeight,
          textColor: titleColor),
      centerTitle: true,
      actions: [],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(UIUtils.isMobile(context) ? 60 : 80);
}
