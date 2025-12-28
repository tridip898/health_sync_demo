import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/date_time.extensions.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_date_picker.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/core/widgets/profile_image_picker.dart';

import '../controllers/create_profile_controller.dart';

class CreateProfileView extends GetView<CreateProfileController> {
  const CreateProfileView({super.key});

  static const background = Color(0xFFF6F8F7);
  static const primary = Color(0xFF13ECA4);
  static const primaryDark = Color(0xFF0BB57D);
  static const textMain = Color(0xFF0D1B17);
  static const borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: textMain,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          controller.isEditProfile ? 'Update Profile' : 'Create Profile',
          style: textStyle.semiBold.s18,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: padAll24,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: CreateProfileView.borderColor)),
        ),
        child: CustomButton(
          text: 'Continue',
          onPressed: controller.isEditProfile
              ? controller.updateProfileClick
              : controller.createProfileClick,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padAll24,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Let's set you up", style: textStyle.bold.s30),
                ),
                gapH8,
                Text(
                  "Please enter your details to personalize your medical experience.",
                  textAlign: TextAlign.center,
                  style: textStyle.regular.s16.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                gapH(32),
                Obx(() {
                  return ProfileImagePicker(
                    initialImage: controller.profileImage.value,
                    onPickImage: (image) {
                      controller.profileImage.value = image;
                    },
                  );
                }),
                gapH(24),
                CustomTextFormField(
                  labelText: "Full Name",
                  hintText: "Enter full name",
                  controller: controller.nameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                gapH12,
                Text(
                  'Gender',
                  style: textStyle.bold.s16.copyWith(color: Color(0xff0E121B)),
                ),
                gapH8,
                Row(
                  children: [
                    _genderSelectionCard(text: "Male"),
                    gapW12,
                    _genderSelectionCard(text: "Female"),
                    gapW12,
                    _genderSelectionCard(text: "Others"),
                  ],
                ),
                gapH12,
                Obx(() {
                  return CustomDatePickerField(
                    title: "Date of Birth",
                    selectedDate: controller.dateOfBirth.value,
                    initialDate: controller.dateOfBirth.value,
                    onDateSelected: (date) {
                      controller.dateOfBirth.value = date;
                      controller.dobController.text = date.toDMY();
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please select your date of birth';
                      }
                      return null;
                    },
                  );
                }),
                gapH12,
                CustomTextFormField(
                  labelText: "Address",
                  hintText: "e.g. Road 123, New York",
                  controller: controller.addressController,
                ),
                Divider(height: 48),
                Row(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: CreateProfileView.primary,
                      size: 20,
                    ),
                    gapW8,
                    Text(
                      'Contact Info',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                gapH12,
                CustomTextFormField(
                  labelText: "Public Phone Number",
                  hintText: "Enter public phone number",
                  controller: controller.phoneController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }

                    final bdPhoneRegex = RegExp(r'^(?:\+88)?01[3-9]\d{8}$');

                    if (!bdPhoneRegex.hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                gapH12,
                CustomTextFormField(
                  labelText: "Public Email",
                  hintText: "Enter public email",
                  controller: controller.emailController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }

                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderSelectionCard({String text = ""}) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedGender.value == text;
        return InkWell(
          onTap: () {
            controller.selectedGender.value = text;
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Color(0xFF13ECA4).withValues(alpha: .2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Color(0xFF13ECA4) : gray.base300,
                width: 1,
              ),
            ),
            padding: padSym(horizontal: 16, vertical: 12),
            alignment: Alignment.center,
            child: Text(text, style: textStyle.medium.s16),
          ),
        );
      }),
    );
  }
}
