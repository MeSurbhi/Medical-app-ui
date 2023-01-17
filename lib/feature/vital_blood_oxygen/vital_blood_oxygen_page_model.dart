import 'package:domain/model/blood_info_model.dart';
import 'package:domain/model/routine_model.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/base/base_page_view_model.dart';
import 'package:medical_app/utils/asset_utils.dart';
import 'package:medical_app/utils/extension/stream_extention.dart';
import 'package:rxdart/rxdart.dart';

class VitalBloodOxygenViewModel extends BasePageViewModel {
  final BehaviorSubject<List<BloodInfo>> _bloodInfoList =
      BehaviorSubject.seeded([]);

  Stream<List<BloodInfo>> get bloodInfoList => _bloodInfoList.stream;
  final BehaviorSubject<List<Routine>> _routineList =
      BehaviorSubject.seeded([]);

  Stream<List<Routine>> get routineList => _routineList.stream;
  late PageController pageController;
  int? bloodInfoSelectedIndex = 1;
  int? routineSelectedIndex = 1;

  VitalBloodOxygenViewModel() {
    _generateBloodInfo();
    _generateRoutine();
  }

  void _generateBloodInfo() {
    List<BloodInfo> list = [];
    list.add(
        BloodInfo(id: 1, title: 'Blood Group', icon: AssetUtils.bloodGroup));
    list.add(
        BloodInfo(id: 1, title: 'Blood Oxygen', icon: AssetUtils.bloodOxygen));
    list.add(BloodInfo(
        id: 1, title: 'Blood Pressure', icon: AssetUtils.bloodPressure));
    list.add(
        BloodInfo(id: 1, title: 'Body Weight', icon: AssetUtils.bodyWeight));
    list.add(BloodInfo(
        id: 1, title: 'Respiratory Rate', icon: AssetUtils.respiratoryRate));
    list.add(BloodInfo(
        id: 1, title: 'Body Temperature', icon: AssetUtils.bodyWeight));

    _bloodInfoList.safeAdd(list);
  }

  void _generateRoutine() {
    List<Routine> list = [];
    list.add(Routine(id: 1, title: 'General', icon: AssetUtils.general));
    list.add(Routine(id: 1, title: 'Resting', icon: AssetUtils.resting));
    list.add(Routine(
        id: 1, title: 'After Exercise', icon: AssetUtils.afterExercise));
    list.add(Routine(
        id: 1, title: 'Before Exercise', icon: AssetUtils.beforeExercise));
    list.add(Routine(id: 1, title: 'Excited', icon: AssetUtils.excited));

    _routineList.safeAdd(list);
  }

  bloodInfoSelected(int index) {
    bloodInfoSelectedIndex = index;
    notifyListeners();
  }

  routineSelected(int index) {
    routineSelectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _bloodInfoList.close();
    super.dispose();
  }
}
