import 'package:domain/model/blood_oxygen_model.dart';
import 'package:medical_app/base/base_page_view_model.dart';
import 'package:medical_app/utils/extension/stream_extention.dart';
import 'package:rxdart/rxdart.dart';

class BloodOxygenViewModel extends BasePageViewModel {
  final BehaviorSubject<List<BloodOxygen>> _bloodOxygenList = BehaviorSubject.seeded([]);

  Stream<List<BloodOxygen>> get bloodOxygenList => _bloodOxygenList.stream;
  int? groupValue = 0;


  BloodOxygenViewModel() {
    _generateBloodOxygenList();

  }
  routineSelected(int value) {
    groupValue = value;
    notifyListeners();
  }

  void _generateBloodOxygenList() {
    List<BloodOxygen> list = [];
    list.add(BloodOxygen(
        id: 1,
        spo2: '133',
        age: '3 years 4 Month',
        time: "4:15 am",
        date: "23 Jan 2019"
    ));
    list.add(BloodOxygen(
        id: 1,
        spo2: '133',
        age: '3 years 4 Month',
        time: "4:15 am",
        date: "23 Jan 2019"
    ),);
    list.add(BloodOxygen(
        id: 1,
        spo2: '133',
        age: '3 years 4 Month',
        time: "4:15 am",
        date: "23 Jan 2019"
    ),);

    _bloodOxygenList.safeAdd(list);
  }}