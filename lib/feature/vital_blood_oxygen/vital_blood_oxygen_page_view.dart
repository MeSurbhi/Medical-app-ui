import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_page.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_model.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/feature/vital_blood_oxygen/widgets/blood_info_widget.dart';
import 'package:medical_app/feature/vital_blood_oxygen/widgets/routine_list_widget.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/asset_utils.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';

class VitalBloodOxygenPageView extends BasePageViewWidget<VitalBloodOxygenViewModel> {
  const VitalBloodOxygenPageView(ProviderBase model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, VitalBloodOxygenViewModel model) {
    return Container(
      color: AppColor.colorF5F5F5,
      child: ListView(
        children: [
          const SizedBox(height: 48),
          BloodInfoWidget(model: model),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12, top: 43, bottom: 8),
                child: AppText(
                    title: S.of(context).viewAll,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.grayColor4F4F4F.withOpacity(0.50)),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 15, bottom: 16, left: 22, right: 22),
            width: double.infinity,
            height: 580,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              children: [
                RoutineListWidget(
                  model: model,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, right: 20, left: 20),
                  child: const DottedLine(
                    dashColor: AppColor.primaryColor,
                    dashLength: 5,
                    lineThickness: 1,
                  ),
                ),
                const SizedBox(height: 16),
                const AppText(
                    title: 'January 27, 2022 @ 12:30am',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.grayColor4F4F4F),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         AppText(
                            title: '97',
                            fontSize: 68,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.black,
                        ),
                        AppText(
                            title: S.of(context).spo2,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.black),
                      ],
                    ),
                    const AppText(
                        title: 'Age:  4 years, 5months',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.primaryColor),
                    const SizedBox(height: 20),
                    const AppText(
                        title: 'Notes :',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.grayColorA6AAB4),
                    Container(
                      margin: const EdgeInsets.only(bottom: 22, top: 5),
                      width: double.infinity,
                      height: 139,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: AppColor.color2F2D3D, //
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: const AppText(
                            title: 'Blood group from test done on 27th January 2022',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            textColor: AppColor.grayColor243656),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
