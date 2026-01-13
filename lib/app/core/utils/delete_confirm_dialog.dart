import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';

import '../extensions/widget_extension.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onYes;

  const DeleteConfirmDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(

              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.delete_forever,
                color: red.base500,
                size: 30,
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(text: 'No', variant: CustomButtonVariant.filled, borderColor: Colors.red,textColor: Colors.black,backgroundColor: gray.base100,  onPressed: () => Get.back(),),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child:CustomButton(text: 'Yes',  onPressed: () {
                    Get.back();
                    onYes();
                  },),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
