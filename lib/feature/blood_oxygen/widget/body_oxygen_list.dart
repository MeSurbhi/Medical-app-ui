import 'package:domain/model/blood_oxygen_model.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_model.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/stream_builder/app_stream_builder.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';

class BloodOxygenList extends StatelessWidget {
  final BloodOxygenViewModel model;

  const BloodOxygenList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: AppText(
              title: S.of(context).spo2,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              textColor: AppColor.grayColor979797),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 30, top: 38),
        child: AppText(
            title: S.of(context).bloodOxygen,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            textColor: AppColor.primaryColor),
      ),
      const SizedBox(height: 28),
      AppStreamBuilder<List<BloodOxygen>>(
          initialData: const [],
          stream: model.bloodOxygenList,
          dataBuilder: (context, data) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: IntrinsicHeight(
                            child: Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                        title: data[index].time ?? '',
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColor.primaryColor),
                                    AppText(
                                        title: data[index].date ?? '',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColor.black),
                                  ],
                                ),
                                const VerticalDivider(),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 9,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 3,
                                        ),
                                        child: Row(
                                          children: [
                                            AppText(
                                                title: data[index].spo2 ?? '',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                textColor: AppColor.black),
                                            AppText(
                                                title: S.of(context).spo2,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                textColor: AppColor.black),
                                          ],
                                        ),
                                      ),
                                      AppText(
                                          title:
                                              '${S.of(context).age}: ${data[index].age}',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColor.grayColor2C3A4B),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.black,
                            size: 22,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Divider())
                      ],
                    );
                  }),
            );
          }),
    ]);
  }
}
