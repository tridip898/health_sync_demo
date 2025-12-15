import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Health Sync',
        leading: Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.network(
              controller.profileImage,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.88,
          children: [
            _tile(
              bg: cyan.base100,
              icon: Icons.medical_services,
              title: 'Doctors',
              onTap: () {
                Get.toNamed(Routes.DOCTOR_LIST);
              },
            ),
            _tile(
              bg: magenda.base100,
              icon: Icons.calendar_month,
              title: 'Appointments',
              onTap: () {},
            ),
            _tile(
              bg: yellow.base100,
              icon: Icons.medical_information,
              title: 'My History',
              onTap: () {},
            ),
            _tile(
              bg: red.base100,
              icon: Icons.receipt_long,
              title: 'Prescriptions',
              onTap: () {},
            ),
            _tile(
              bg: blue.base100,
              icon: Icons.card_membership,
              title: 'Reports',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile({
    required Color bg,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black.withOpacity(.7)),
            const SizedBox(height: 8),
            Text(title, style: textStyle.semiBold.s20),
          ],
        ),
      ),
    );
  }
}
