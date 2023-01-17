import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/di/vital_blood_oxygen/vital_blood_oxygen_module.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_view.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_model.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/appbar/custom_appbar.dart';
import 'package:medical_app/utils/ui/molecule/device_detector_widget.dart';

class VitalBloodOxygenPage extends BasePage<VitalBloodOxygenViewModel> {
  const VitalBloodOxygenPage({super.key});

  @override
  State<StatefulWidget> createState() => VitalBloodOxygenPageState();
}

class VitalBloodOxygenPageState extends BaseStatefulPage<VitalBloodOxygenViewModel, VitalBloodOxygenPage> with WidgetsBindingObserver {
  @override
  ProviderBase provideBase() {
    return vitalBloodOxygenProvider;
  }

  @override
  void onModelReady(VitalBloodOxygenViewModel model) {
    super.onModelReady(model);
    model.pageController = PageController(
      initialPage: 0,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  Color scaffoldBackgroundColor() {
    return AppColor.colorF5F5F5;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return CustomAppBar(
      title: S.of(context).vitals,
      backgroundColor: AppColor.primaryColor,
      context: context,
    );
  }

  @override
  Widget buildView(BuildContext context, VitalBloodOxygenViewModel model) {
    return DeviceDetectorWidget(
      phoneView: () => VitalBloodOxygenPageView(provideBase()),
      tabletView: () => VitalBloodOxygenPageView(provideBase()),
      webSiteView: () => VitalBloodOxygenPageView(provideBase()),
    );
  }
}
