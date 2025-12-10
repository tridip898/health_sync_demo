import 'package:flutter/material.dart';
import 'package:health_sync_question/environment_config.dart';
import 'package:get/get.dart';
import 'package:network/network.dart';
import 'app/core/controller/app_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentConfig.init();

  NetworkInitializer.initialize(
    interceptors: [
      // AuthInterceptor(),
      LogInterceptor(),
      CurlGeneratorInterceptor(),
      // CarryBeeErrorInterceptor(),
    ],
  );

  runApp(
    GetMaterialApp(
      title: "Health Sync Question",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put<AppController>(AppController());
      }),
    ),
  );
}
