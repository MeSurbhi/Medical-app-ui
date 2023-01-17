import 'package:flutter/cupertino.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_model.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';

class SegmentedControllerPage extends StatefulWidget {
  final BloodOxygenViewModel model;

  const SegmentedControllerPage({Key? key, required this.model})
      : super(key: key);

  @override
  _SegmentedControllerPageState createState() => _SegmentedControllerPageState();
}

class _SegmentedControllerPageState extends State<SegmentedControllerPage> {
  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: AppColor.colorF5F5F5,
        thumbColor: AppColor.white,
        groupValue: widget.model.groupValue,
        children: {
          0: buildSegment(S.of(context).week),
          1: buildSegment(S.of(context).month),
          2: buildSegment(S.of(context).year),
          3: buildSegment(S.of(context).allTime),
        },
        onValueChanged: (value) {
          widget.model.routineSelected(value!);
        },
      ));

  Widget buildSegment(String text) {
    return AppText(
        title: text,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        textColor: AppColor.black);
  }
}
