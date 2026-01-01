import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImageFromGallery({bool crop = false}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return crop ? await _cropImage(pickedFile.path) : File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
    return null;
  }

  static Future<File?> pickImageFromCamera({bool crop = true}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return crop ? await _cropImage(pickedFile.path) : File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
    return null;
  }

  static Future<File?> _cropImage(String filePath) async {
    try {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath,
        compressQuality: 85,
        maxWidth: 1080,
        maxHeight: 1080,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: const Color(0xFF6200EE),
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: const Color(0xFF6200EE),
            showCropGrid: true,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: false,
          ),
        ],
      );

      return croppedFile != null ? File(croppedFile.path) : null;
    } catch (e) {
      print('Error cropping image: $e');
      return null;
    }
  }
}