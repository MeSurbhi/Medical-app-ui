import 'package:domain/model/routine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_model.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/stream_builder/app_stream_builder.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';

class RoutineListWidget extends StatelessWidget {
  final VitalBloodOxygenViewModel model;

  const RoutineListWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AppStreamBuilder<List<Routine>>(
          initialData: const [],
          stream: model.routineList,
          dataBuilder: (context, data) {
            return ListView.builder(
                itemCount: data!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      model.routineSelected(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12, left: 8),
                      width: 54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                model.routineSelectedIndex != null &&
                                        model.routineSelectedIndex == index
                                    ? AppColor.primaryColor
                                    : AppColor.colorF5F5F5,
                            child: SvgPicture.asset(
                              data[index].icon!,
                              height: 26,
                              width: 26,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AppText(
                            title: data[index].title ?? '',
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.grayColor4F4F4F,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
