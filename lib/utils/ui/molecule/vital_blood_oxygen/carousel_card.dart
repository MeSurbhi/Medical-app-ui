import 'package:flutter/material.dart';
import 'package:medical_app/utils/color_utils.dart';

class CarouselCard extends StatelessWidget {
  final String asset;
  final String label;
  final bool isTablet;
  CarouselCard({Key? key, required this.asset, required this.label, this.isTablet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool elevated = MediaQuery.of(context).size.width>500;
    return Card(
      elevation: elevated?5:0,
      color: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 10
        ),
        height: 120,
        width: isTablet? 150 : 106,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(asset,
              height: isTablet? 45:26,
              width: isTablet? 45:26,
              fit: BoxFit.cover,
            ),
            Wrap(
              children: [
                Text(label,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor
                  ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
