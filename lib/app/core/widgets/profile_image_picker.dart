import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(Uint8List image) onPickImage;
  final Uint8List? initialImage;

  const ProfileImagePicker({
    super.key,
    required this.onPickImage,
    this.initialImage,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _imageBytes = widget.initialImage;
  }

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _imageBytes = result.files.first.bytes; // read as bytes
        });
        widget.onPickImage(result.files.first.bytes!);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ProfileImage(imageBytes: _imageBytes),

          TextButton(
            onPressed: () {
              _pickImage();
            },
            child: Text(
              'Upload Image',
              style: textStyle.bold.s16.copyWith(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required Uint8List? imageBytes})
    : _imageBytes = imageBytes;

  final Uint8List? _imageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey),
      ),
      padding: padAll5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: _imageBytes != null
            ? Image.memory(
                _imageBytes!,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )
            : Image.asset(
                alignment: Alignment.topCenter,
                'assets/user.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
