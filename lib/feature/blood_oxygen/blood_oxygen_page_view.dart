import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_model.dart';
import 'package:medical_app/feature/blood_oxygen/widget/body_oxygen_list.dart';
import 'package:medical_app/feature/blood_oxygen/widget/blood_oxygen_chart.dart';
import 'package:medical_app/feature/blood_oxygen/widget/segmented_controllers.dart';
import 'package:medical_app/utils/color_utils.dart';

class BloodOxygenPageView extends BasePageViewWidget<BloodOxygenViewModel> {
  const BloodOxygenPageView(ProviderBase model, {super.key}) : super(model);

  @override
  Widget build(BuildContext context, BloodOxygenViewModel model) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 36, right: 40, left: 36, bottom: 19),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: SegmentedControllerPage(model: model),
        ),
        BloodOxygenChartPage(),
        BloodOxygenList(model: model),
      ],
    );
  }
}
