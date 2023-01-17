import 'package:domain/model/blood_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_model.dart';
import 'package:medical_app/main/navigation/route_paths.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/stream_builder/app_stream_builder.dart';
import 'package:medical_app/utils/ui/molecule/text/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BloodInfoWidget extends StatelessWidget {
  final VitalBloodOxygenViewModel model;

  const BloodInfoWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,

      child: AppStreamBuilder<List<BloodInfo>>(
          initialData: const [],
          stream: model.bloodInfoList,
          dataBuilder: (context, data) {
            return Column(children: [
              Expanded(
                child: PageView.builder(
                    controller: model.pageController,
                    itemCount: data!.length,
                    itemBuilder: (context, i) {
                      return Center(
                        child: GridView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  model.bloodInfoSelected(index);
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.bloodOxygenPage,
                                  );
                                },
                                child: Card(
                                  color: model.bloodInfoSelectedIndex != null && model.bloodInfoSelectedIndex == index?AppColor.primaryColor: AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            data[index].icon!,
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          AppText(
                                            title: data[index].title ?? '',
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                            textColor:model.bloodInfoSelectedIndex == index?AppColor.white: AppColor.grayColor243656,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                              );
                            }),
                      );
                    }),
              ),
              const SizedBox(height: 22),
              data.isEmpty
                  ? Container()
                  : SmoothPageIndicator(
                      controller: model.pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: AppColor.primaryColor,
                        type: WormType.normal,
                      ),
                    ),
            ]);
          }),
    );
  }
}
