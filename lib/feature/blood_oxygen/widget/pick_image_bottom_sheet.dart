import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/utils/ui/molecule/button/custom_button.dart';
import 'package:medical_app/utils/ui/molecule/button/outlined_button.dart';

class GetImageBottomSheet extends StatelessWidget {
  const GetImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 353,
        padding:
            const EdgeInsets.only(top: 50, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            AppSecondaryButton(
              label: S.of(context).selectPhoto,
              onTap: () {},
            ),
            const SizedBox(height: 15),
            AppSecondaryButton(
              label: S.of(context).takeAPhoto,
              onTap: () {},
            ),
            const SizedBox(height: 15),
            AppSecondaryButton(
              label: S.of(context).manual,
              onTap: () {},
            ),
            const SizedBox(height: 15),

            OutlinedButtonWidget(
              title: S.of(context).cancel,
              onPressed: () {},
            )
          ],
        ));
  }
}
