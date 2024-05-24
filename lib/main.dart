import 'package:flutter/material.dart';
import 'package:reddist_clone_app/core/constants/app_strings.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: Pallete.darkModeAppTheme,
      home: SizedBox(),
    );
  }
}
