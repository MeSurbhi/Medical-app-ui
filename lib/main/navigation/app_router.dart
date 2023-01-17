import 'package:flutter/cupertino.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page.dart';
import 'package:medical_app/main/navigation/route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.vitalBloodOxygen:
        return CupertinoPageRoute(
          builder: (context) => const VitalBloodOxygenPage(),
          settings: const RouteSettings(name: RoutePaths.vitalBloodOxygen),
        );
      case RoutePaths.bloodOxygenPage:
        return CupertinoPageRoute(
          builder: (context) => const BloodOxygenPage(),
          settings: const RouteSettings(name: RoutePaths.bloodOxygenPage),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
