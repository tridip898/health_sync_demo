import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/repository/profile_repository.dart';

class CreateProfileController extends GetxController {
  final ProfileRepository _profileRepository = ProfileRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final RxString selectedGender = 'Male'.obs;
  final Rx<Uint8List?> profileImage = Rx(null);
  final bool isEditProfile = Get.arguments ?? false;
  final Rx<DateTime?> dateOfBirth = Rx(null);

  @override
  void onInit() {
    super.onInit();
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
      profileImage.value = profile?.image != null
          ? base64Decode(profile!.image!)
          : null;
      dobController.text = DateFormat(
        'dd-MM-yyyy',
      ).format(DateTime.parse(profile?.dateOfBirth ?? ''));
      final parsed = stringToDateTime(dobController.text);
      dateOfBirth.value = parsed;
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

  void createProfileClick() async {
    if (formKey.currentState!.validate()) {
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
            "file": dio.MultipartFile.fromBytes(
              profileImage.value!,
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

  updateProfileClick() async{
    if (formKey.currentState!.validate()) {
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
            "file": dio.MultipartFile.fromBytes(
              profileImage.value!,
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
