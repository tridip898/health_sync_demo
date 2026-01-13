import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/modules/auth/user_bindings_list/widgets/user_card.dart';

import '../controllers/user_bindings_list_controller.dart';

class UserBindingsListView extends GetView<UserBindingsListController> {
  const UserBindingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Link User'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: padSym(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: '',
              hintText: 'Search by name or ID...',
              controller: controller.searchController,
              prefixIcon: Padding(
                padding: padSym(horizontal: 12),
                child: Icon(Icons.search, color: gray.base400, size: 20),
              ),
            ),
            gapH20,
            Obx(() {
              if (controller.isLoading.value) {
                return SizedBox.shrink();
              }
              if (controller.bindingUserList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "No Users Found for Binding",
                      style: textStyle.bold.s18,
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    final user = controller.bindingUserList[index];
                    return Obx(() {
                      return UserCard(
                        user: user,
                        selected: controller.selectedUser.value == user,
                        onTap: () {
                          controller.selectUser(user);
                        },
                      );
                    });
                  },
                  separatorBuilder: (_, index) {
                    return gapH16;
                  },
                  itemCount: controller.bindingUserList.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
