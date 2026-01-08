import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_sync_question/app/core/widgets/flavor_banner.dart';

abstract class EnvironmentConfig {
  static late Environment _currentEnvironment;

  static Environment get currentEnvironment => _currentEnvironment;

  static EnvironmentModel get currentEnvironmentData {
    return _environmentData[currentEnvironment]!;
  }

  static init() {
    _currentEnvironment = Environment.values.firstWhere(
      (env) => env.name == appFlavor,
      orElse: () => Environment.dev,
    );
  }

  static final Map<Environment, EnvironmentModel> _environmentData = {
    Environment.dev: EnvironmentModel.devEnv,
    Environment.stage: EnvironmentModel.stageEnv,
    Environment.preprod: EnvironmentModel.preprodEnv,
    Environment.prod: EnvironmentModel.prodEnv,
  };

  static setAvailableEnvironment(String? remoteConfigData) {
    if (remoteConfigData == null) return;
    final envConfigModel = EnvironmentModel.fromString(remoteConfigData);
    _environmentData[_currentEnvironment] =
        _environmentData[_currentEnvironment]!.copyWith(
          baseGateway: envConfigModel.baseGateway.isNotEmpty
              ? envConfigModel.baseGateway
              : null,
          websiteUrl: envConfigModel.websiteUrl.isNotEmpty
              ? envConfigModel.websiteUrl
              : null,
          apiBase: envConfigModel.apiBase.isNotEmpty
              ? envConfigModel.apiBase
              : null,
          authBase: envConfigModel.authBase.isNotEmpty
              ? envConfigModel.authBase
              : null,
          imageBase: envConfigModel.imageBase.isNotEmpty
              ? envConfigModel.imageBase
              : null,
          serviceKey: envConfigModel.serviceKey.isNotEmpty
              ? envConfigModel.serviceKey
              : null,
          origin: envConfigModel.origin.isNotEmpty
              ? envConfigModel.origin
              : null,
          referer: envConfigModel.referer.isNotEmpty
              ? envConfigModel.referer
              : null,
          uploadUrl: envConfigModel.uploadUrl.isNotEmpty
              ? envConfigModel.uploadUrl
              : null,
          packageName: envConfigModel.packageName.isNotEmpty
              ? envConfigModel.packageName
              : null,
        );
  }

  static flavorBanner({required Widget child, required bool show}) {
    return FlavorBanner(
      show: show,
      bannerName: EnvironmentConfig.currentEnvironment.name,
      bannerColor: _getBannerColor(EnvironmentConfig.currentEnvironment),
      child: child,
    );
  }

  static Color _getBannerColor(Environment env) {
    switch (env) {
      case Environment.dev:
        return Colors.blue;
      case Environment.stage:
        return Colors.green;
      case Environment.preprod:
        return Colors.orange;
      case Environment.prod:
        return Colors.transparent;
    }
  }
}

enum Environment { dev, stage, prod, preprod }

class EnvironmentModel {
  final Environment environment;
  final String baseGateway;
  final String websiteUrl;
  final String apiBase;
  final String authBase;
  final String imageBase;
  final String serviceKey;
  final String origin;
  final String referer;
  final String uploadUrl;
  final String notificationApiBase;
  final String packageName;
  final String onesignalKey;

  EnvironmentModel({
    required this.environment,
    required this.baseGateway,
    required this.notificationApiBase,
    required this.websiteUrl,
    required this.apiBase,
    required this.authBase,
    required this.imageBase,
    required this.serviceKey,
    required this.origin,
    required this.referer,
    required this.uploadUrl,
    required this.packageName,
    required this.onesignalKey,
  });

  factory EnvironmentModel.fromString(String stringData) {
    Map<String, dynamic> json = jsonDecode(stringData);
    return EnvironmentModel(
      environment: EnvironmentConfig._currentEnvironment,
      baseGateway: json['baseGateway'] ?? '',
      websiteUrl: json['websiteUrl'] ?? '',
      apiBase: json['apiBase'] ?? '',
      notificationApiBase: json['notificationApiBase'] ?? '',
      authBase: json['authBase'] ?? '',
      imageBase: json['imageBase'] ?? '',
      serviceKey: json['serviceKey'] ?? '',
      origin: json['origin'] ?? '',
      referer: json['referer'] ?? '',
      uploadUrl: json['uploadUrl'] ?? '',
      packageName: json['packageName'] ?? '',
      onesignalKey: json['onesignalKey'] ?? '',
    );
  }

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) {
    return EnvironmentModel(
      environment: EnvironmentConfig._currentEnvironment,
      baseGateway: json['baseGateway'] ?? '',
      websiteUrl: json['websiteUrl'] ?? '',
      apiBase: json['apiBase'] ?? '',
      notificationApiBase: json['notificationApiBase'] ?? '',
      authBase: json['authBase'] ?? '',
      imageBase: json['imageBase'] ?? '',
      serviceKey: json['serviceKey'] ?? '',
      origin: json['origin'] ?? '',
      referer: json['referer'] ?? '',
      uploadUrl: json['uploadUrl'] ?? '',
      packageName: json['packageName'] ?? '',
      onesignalKey: json['onesignalKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'environment': environment,
      'baseGateway': baseGateway,
      'websiteUrl': websiteUrl,
      'apiBase': apiBase,
      'authBase': authBase,
      'notificationApiBase': notificationApiBase,
      'imageBase': imageBase,
      'serviceKey': serviceKey,
      'origin': origin,
      'referer': referer,
      'uploadUrl': uploadUrl,
      'packageName': packageName,
      'onesignalKey': onesignalKey,
    };
  }

  @override
  String toString() {
    return 'EnvironmentModel{baseGateway: $baseGateway, websiteUrl: $websiteUrl, apiBase: $apiBase, authBase: $authBase, imageBase: $imageBase, serviceKey: $serviceKey, origin: $origin, referer: $referer, uploadUrl: $uploadUrl}';
  }

  EnvironmentModel copyWith({
    Environment? environment,
    String? baseGateway,
    String? websiteUrl,
    String? apiBase,
    String? authBase,
    String? imageBase,
    String? serviceKey,
    String? origin,
    String? referer,
    String? uploadUrl,
    String? packageName,
    String? onesignalKey,
  }) {
    return EnvironmentModel(
      environment: environment ?? this.environment,
      baseGateway: baseGateway ?? this.baseGateway,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      apiBase: apiBase ?? this.apiBase,
      authBase: authBase ?? this.authBase,
      imageBase: imageBase ?? this.imageBase,
      serviceKey: serviceKey ?? this.serviceKey,
      notificationApiBase: notificationApiBase,
      origin: origin ?? this.origin,
      referer: referer ?? this.referer,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      packageName: packageName ?? this.packageName,
      onesignalKey: onesignalKey ?? this.onesignalKey,
    );
  }

  static final devEnv = EnvironmentModel(
    environment: Environment.dev,
    baseGateway: "",
    websiteUrl: "",
    apiBase: "http://10.70.34.123:4000",
    authBase: "http://10.70.34.123:4000",
    notificationApiBase: "",
    imageBase: "",
    serviceKey: "",
    origin: "",
    referer: "",
    uploadUrl: "",
    packageName: 'com.healthsync.app.dev',
    onesignalKey: '',
  );

  static final stageEnv = EnvironmentModel(
    environment: Environment.stage,
    baseGateway: "",
    websiteUrl: "",
    apiBase: "http://10.70.34.123:4000",
    authBase: "http://10.70.34.123:4000",
    imageBase: "",
    notificationApiBase: "",
    serviceKey: "",
    origin: "",
    referer: "",
    uploadUrl: "",
    packageName: 'com.healthsync.app.stage',
    onesignalKey: '',
  );

  static final preprodEnv = EnvironmentModel(
    environment: Environment.preprod,
    baseGateway: "",
    websiteUrl: "",
    apiBase: "http://10.70.34.123:4000/",
    authBase: "http://10.70.34.123:4000/",
    imageBase: "",
    notificationApiBase: "",
    serviceKey: "",
    origin: "",
    referer: "",
    uploadUrl: "",
    packageName: 'com.healthsync.app.preprod',
    onesignalKey: '',
  );

  static final prodEnv = EnvironmentModel(
    environment: Environment.prod,
    baseGateway: "",
    websiteUrl: "",
    apiBase: "http://10.70.34.123:4000",
    authBase: "http://10.70.34.123:4000",
    imageBase: "",
    notificationApiBase: "",
    serviceKey: "",
    origin: "",
    referer: "",
    uploadUrl: "",
    packageName: 'com.healthsync.app',
    onesignalKey: '',
  );
}
