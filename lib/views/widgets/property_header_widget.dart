import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../viewmodels/property_controller.dart';

class PropertyHeaderWidget extends StatelessWidget {
  const PropertyHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyController>();

    return Obx(() {
      final property = controller.property.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.name,
            style: const TextStyle(
              fontSize: AppConstants.fontSizeTitle,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: AppConstants.iconSizeSmall,
                color: AppColors.secondary,
              ),
              const SizedBox(width: 4),
              Text(
                property.location,
                style: const TextStyle(
                  fontSize: AppConstants.fontSizeMedium,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    AppConstants.radiusSmall,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: AppConstants.iconSizeSmall,
                      color: AppColors.rating,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      property.rating.toString(),
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeMedium,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Text(
                '${property.reviewCount.toString()} reviews',
                style: const TextStyle(
                  fontSize: AppConstants.fontSizeMedium,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
