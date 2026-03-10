import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/controller/app_controller.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/image_picker_utils.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:health_sync_question/app/data/repository/profile_repository.dart';
import 'package:health_sync_question/app/modules/auth/auth_mixin.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

class CreateProfileController extends GetxController with AuthMixin {
  final ProfileRepository _profileRepository = ProfileRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final RxString selectedGender = 'Male'.obs;

  final bool isEditProfile = Get.arguments ?? false;
  final Rx<DateTime?> dateOfBirth = Rx(null);
  Rx<File?> profileImage = Rx<File?>(null);
  final RxString profileImageUrl = "".obs;

  UserModel? get userModel {
    if (Get.isRegistered<AppController>()) {
      return Get.find<AppController>().userModel.value;
    }
    return null;
  }

  @override
  void onReady() {
    if (isEditProfile) {
      final profile = appController.userModel.value?.profile;
      log("Gender ${profile?.gender}");
      nameController.text = profile?.fullName ?? '';
      addressController.text = profile?.address ?? '';
      phoneController.text = profile?.publicPhoneNumber ?? '';
      emailController.text = profile?.publicEmail ?? '';
      selectedGender.value = (profile?.gender)?.capitalizeFirst ?? 'Male';

      profileImageUrl.value = profile?.image ?? '';
      log("profileImageUrl $profileImageUrl");
      dobController.text = DateFormat(
        'dd-MM-yyyy',
      ).format(DateTime.parse(profile?.dateOfBirth ?? ''));
      final parsed = stringToDateTime(dobController.text);
      dateOfBirth.value = parsed;
    } else {
      phoneController.text = userModel?.phoneNumber ?? '';
    }
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    profileImage.close();
    super.onClose();
  }

  pickImage() async {
    final file = await ImagePickerUtil.pickImageFromGallery();
    if (file != null) {
      profileImage.value = file;
    }
  }

  void createProfileClick() async {
    if (formKey.currentState?.validate() ?? false) {
      Loading.show();
      final response = await _profileRepository.createProfile(
        data: {
          "fullName": nameController.text,
          "gender": selectedGender.value.toUpperCase(),
          "dateOfBirth": dobController.text,
          if (addressController.text.isNotEmpty)
            "address": addressController.text,
          "publicPhoneNumber": phoneController.text,
          if (emailController.text.isNotEmpty)
            "publicEmail": emailController.text,
          if (profileImage.value != null)
            "file": await dio.MultipartFile.fromFile(
              profileImage.value?.path ?? '',
              filename: "doctor_${nameController.text}.jpg",
            ),
        },
      );
      Loading.hide();
      await response.fold(
        (error) {
          Toaster.error(error.message ?? 'Failed to create profile');
        },
        (success) async {
          Toaster.success(success.message ?? 'Profile created successfully');
          await navigateAfterProfileAction();
        },
      );
    }
  }

  DateTime? stringToDateTime(String text) {
    if (text.isEmpty) return null;

    if (text.contains("T")) {
      return DateTime.tryParse(text);
    }

    try {
      return DateFormat('dd-MM-yyyy').parse(text);
    } catch (e) {
      return null;
    }
  }

  updateProfileClick() async {
    if (formKey.currentState?.validate() ?? false) {
      Loading.show();
      final response = await _profileRepository.updateProfile(
        data: {
          "fullName": nameController.text,
          "gender": selectedGender.value.toUpperCase(),
          "dateOfBirth": dobController.text,
          if (addressController.text.isNotEmpty)
            "address": addressController.text,
          "publicPhoneNumber": phoneController.text,
          if (emailController.text.isNotEmpty)
            "publicEmail": emailController.text,
          if (profileImage.value != null)
            "file": await dio.MultipartFile.fromFile(
              profileImage.value?.path ?? '',
              filename: "doctor_${nameController.text}.jpg",
            ),
        },
      );
      Loading.hide();
      response.fold(
        (error) {
          Toaster.error(error.message ?? 'Failed to create profile');
        },
        (success) async {
          Toaster.success(success.message ?? 'Profile created successfully');
          await appController.loadProfile();
          Get.back();
        },
      );
    }
  }
}
