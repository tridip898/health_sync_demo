import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:health_sync_question/app/core/controller/app_controller.dart';
import 'package:network/network.dart';

class AppErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logError(err.response?.data);
    if (err.response?.statusCode == 503) {
      handler.resolve(
        Response(
          statusCode: 200,
          requestOptions: err.requestOptions,
          data: ErrorResponse(message: "Maintenance mode.", data: null),
        ),
      );
    } else {
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          handler.resolve(
            Response(
              statusCode: 200,
              requestOptions: err.requestOptions,
              data: ErrorResponse(
                message: "Request time out, Please try again later.",
                data: null,
              ),
            ),
          );
          break;
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          handler.resolve(
            Response(
              statusCode: 200,
              requestOptions: err.requestOptions,
              data: ErrorResponse(
                message:
                    err.response?.data is Map &&
                        err.response?.data['message'] is String
                    ? err.response?.data['message']
                    : "Unknown error, Please try again later.",
                data: null,
              ),
            ),
          );
          break;
        case DioExceptionType.badCertificate:
          handler.resolve(
            Response(
              statusCode: 200,
              requestOptions: err.requestOptions,
              data: ErrorResponse(
                message:
                    err.response?.data is Map &&
                        err.response?.data['message'] is String
                    ? err.response?.data['message']
                    : "Authorization failed, Please try again later.",
                data: null,
              ),
            ),
          );
        case DioExceptionType.badResponse:
          if ((err.response?.statusCode ?? 0) >= 500) {
            handler.resolve(
              Response(
                statusCode: 200,
                requestOptions: err.requestOptions,
                data: ErrorResponse(
                  message:
                      err.response?.data is Map &&
                          err.response?.data['message'] is String
                      ? err.response?.data['message']
                      : "Internal server error",
                  data: ApiResponseErrorType.serverError,
                ),
              ),
            );
          } else if ((err.response?.statusCode ?? 0) >= 400) {
            if ((err.response?.statusCode ?? 0) == 422) {
              handler.resolve(
                Response(
                  statusCode: 200,
                  requestOptions: err.requestOptions,
                  data: ErrorResponse(
                    message:
                        err.response?.data['message'] ?? 'Validation error',
                    data: ApiResponseErrorType.response,
                  ),
                ),
              );
            } else {
              if ((err.response?.statusCode ?? 0) == 401) {
                Future.delayed(Duration(seconds: 2), () {
                  getx.Get.find<AppController>().signOut();
                });
              }

              handler.resolve(
                Response(
                  statusCode: 200,
                  requestOptions: err.requestOptions,
                  data: ErrorResponse(
                    message:
                        err.response?.data is Map &&
                            err.response?.data['message'] is String
                        ? err.response?.data['message']
                        : err.response?.statusCode == 401
                        ? "Authorization failed"
                        : "Un authorized request.",
                    data: ApiResponseErrorType.response,
                  ),
                ),
              );
            }
          } else {
            handler.next(err);
          }
          break;
        case DioExceptionType.cancel:
          handler.resolve(
            Response(
              statusCode: 200,
              requestOptions: err.requestOptions,
              data: ErrorResponse(
                message: "Unknown error, Please try again later.",
                data: null,
              ),
            ),
          );
          break;
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data['error'] == true) {
      handler.resolve(
        Response(
          statusCode: 200,
          requestOptions: response.requestOptions,
          data: ErrorResponse(
            message: response.data is Map && response.data['message'] is String
                ? response.data['message']
                : "Unknown error, Please try again later.",
            data: null,
          ),
        ),
      );
    } else {
      handler.next(response);
    }
  }
}
