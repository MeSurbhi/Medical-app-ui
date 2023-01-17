import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/main/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ProviderScope(child:App(),));
}

