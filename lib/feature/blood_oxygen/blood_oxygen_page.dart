import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/di/blood_oxygen/blood_oxygen_module.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_model.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_view.dart';
import 'package:medical_app/feature/blood_oxygen/widget/pick_image_bottom_sheet.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/color_utils.dart';
import 'package:medical_app/utils/ui/molecule/appbar/custom_appbar.dart';
import 'package:medical_app/utils/ui/molecule/device_detector_widget.dart';

class BloodOxygenPage extends BasePage<BloodOxygenViewModel> {
  const BloodOxygenPage({super.key});

  @override
  State<StatefulWidget> createState() => BloodOxygenPageState();
}

class BloodOxygenPageState extends BaseStatefulPage<BloodOxygenViewModel, BloodOxygenPage>
    with WidgetsBindingObserver {
  @override
  ProviderBase provideBase() {
    return bloodOxygenProvider;
  }

  @override
  void onModelReady(BloodOxygenViewModel model) {
    super.onModelReady(model);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  Color scaffoldBackgroundColor() {
    return AppColor.colorF5F5F5;
  }
  @override
  Widget floatingActionButton(){
    return FloatingActionButton(
      onPressed: (){
        _showAddCardBottomSheet(context);
      },
      child: const Icon(Icons.add),
      backgroundColor: AppColor.primaryColor,
    );
  }
  void _showAddCardBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,

        builder: (context)=> const GetImageBottomSheet());
  }
  @override
  PreferredSizeWidget? buildAppbar() {
    return CustomAppBar(
      leadingIcon: const Icon(Icons.arrow_back_ios_new, color: AppColor.white,),
      onLeadingClick: (){Navigator.pop(context);},
      title: S.of(context).bloodOxygen,
      context: context,
      backgroundColor: AppColor.primaryColor,
    );
  }

  @override
  Widget buildView(BuildContext context, BloodOxygenViewModel model) {
    return DeviceDetectorWidget(
      phoneView: () => BloodOxygenPageView(provideBase()),
      tabletView: () => BloodOxygenPageView(provideBase()),
      webSiteView: () => BloodOxygenPageView(provideBase()),
    );
  }
}
