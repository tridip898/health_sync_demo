import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flavors.dart';

import 'package:get/get.dart';

import 'app/core/controller/app_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  AppController appController = AppController();
  runApp(
    GetMaterialApp(
      title: "Health Sync Question",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put<AppController>(appController);
      }),
    ),
  );
}
