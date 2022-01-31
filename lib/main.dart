import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_tests_units/src/helpers/dependency_injection.dart';

import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
}
