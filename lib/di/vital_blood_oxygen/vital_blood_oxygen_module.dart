import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/feature/vital_blood_oxygen/vital_blood_oxygen_page_model.dart';

final vitalBloodOxygenProvider = ChangeNotifierProvider.autoDispose<VitalBloodOxygenViewModel>(
      (ref) => VitalBloodOxygenViewModel(),
);
