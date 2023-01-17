import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/feature/blood_oxygen/blood_oxygen_page_model.dart';

final bloodOxygenProvider = ChangeNotifierProvider.autoDispose<BloodOxygenViewModel>(
      (ref) => BloodOxygenViewModel(),
);
