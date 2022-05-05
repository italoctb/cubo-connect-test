import 'dart:async';
import 'package:cubo_connect/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      startSplashScreenTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage("assets/logo-cuboconnect.png"),
                    width: 300.0,
                    height: 300.0,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white));
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, _goToMenu);
  }

  Future<void> _goToMenu() async {
    Get.offAndToNamed(Routes.menu);
  }
}
