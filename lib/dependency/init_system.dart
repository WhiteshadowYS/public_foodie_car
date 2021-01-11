import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initSystem() {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Color(0xFFFFFFFF),
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
