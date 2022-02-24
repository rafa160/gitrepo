import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:githubrepositories/components/custom_colored_container.dart';
import 'package:githubrepositories/screens/home/home_module.dart';
import 'package:githubrepositories/styles/strings.dart';
import 'package:githubrepositories/styles/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Get.offAll(() => HomeModule());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredCustomContainer(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Center(
              child: Hero(
                tag: 'logo1',
                child: Image.asset('assets/images/github.png',scale: 4,)
              ),
            ),
            const Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(Strings.APP_NAME, style: textBoldBlack14,),),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
