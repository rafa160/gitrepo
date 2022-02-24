import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubrepositories/screens/splash/splash_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Application',
      debugShowCheckedModeBanner: false,
      home: SplashModule(),
    );
  }
}