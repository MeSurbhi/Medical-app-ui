import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/main/app_view_model.dart';

ChangeNotifierProvider<AppViewModel> appViewModel =
    ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);
