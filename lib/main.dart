import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/config/network/interceptor/auth_interceptor.dart';
import 'package:health_sync_question/app/core/config/network/interceptor/app_error_interceptor.dart';
import 'package:health_sync_question/environment_config.dart';
import 'package:get/get.dart';
import 'package:network/network.dart';
import 'app/core/controller/app_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentConfig.init();
  final showWrapper =
      EnvironmentConfig.currentEnvironment != Environment.prod || kDebugMode;

  NetworkInitializer.initialize(
    interceptors: [
      AuthInterceptor(),
      LogInterceptor(),
      CurlGeneratorInterceptor(),
      AppErrorInterceptor(),
    ],
  );

  await Common.init(
    enableLogger: showWrapper,
    storageBucket: "healthsync-${EnvironmentConfig.currentEnvironment.name}",
  );

  runApp(
    GetMaterialApp(
      title: "Health Sync Question",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put<AppController>(AppController());
      }),
      getPages: AppPages.routes + NetworkPages.routes,
      routingCallback: (Routing? routing) {
        if (routing != null) {
          NetworkInitializer.setCurrentRoute(routing.current);
        }
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0), devicePixelRatio: 1.0),
          child: SafeArea(
            bottom: true,
            top: false,
            child: EnvironmentConfig.flavorBanner(
              child: CurlViewWrapper(
                show: showWrapper,
                child: child ?? Container(),
              ),
              show: showWrapper,
            ),
          ),
        );
      },
    ),
  );
}
