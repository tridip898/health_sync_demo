import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/controller/app_controller.dart';
import 'package:health_sync_question/environment_config.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains(
      EnvironmentConfig.currentEnvironmentData.apiBase,
    )) {
      final appController = Get.find<AppController>();

      String? token = appController.token;

      if (token != null) {
        options.headers = {
          ...options.headers,
          "Authorization": "Bearer $token",
        };
      }
    } else {
      options.headers = {
        ...options.headers,
        "x-amz-acl": "public-read",
        "Content-Type": "image/png",
      };
    }
    handler.next(options);
  }
}
