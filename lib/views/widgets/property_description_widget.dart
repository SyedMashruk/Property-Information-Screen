import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../viewmodels/property_controller.dart';

class PropertyDescriptionWidget extends StatelessWidget {
  const PropertyDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyController>();

    return Obx(() => Text(
      controller.property.value.description,
      style: const TextStyle(
        fontSize: AppConstants.fontSizeNormal,
        color: AppColors.textPrimary,
        height: 1.6,
      ),
    ));
  }
}