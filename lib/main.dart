import 'package:cubo_connect/config/app_routes.dart';
import 'package:cubo_connect/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return GetMaterialApp(
      title: "Teste - CuboConnect",
      defaultTransition: Transition.cupertino,
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
