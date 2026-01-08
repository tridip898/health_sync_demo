import 'package:network/network.dart';

class DeleteResponseModel extends BaseResponseModel {
  @override
  final bool status;

  @override
  final String message;

  @override
  final int statusCode;

  final dynamic data;

  DeleteResponseModel({
    required this.status,
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory DeleteResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteResponseModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      statusCode: json['status_code'] as int? ?? 0,
      data: json['data'],
    );
  }
}
