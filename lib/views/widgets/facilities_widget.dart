import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../viewmodels/property_controller.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyController>();

    return Obx(() {
      final facilities = controller.property.value.facilities;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Facilities',
            style: TextStyle(
              fontSize: AppConstants.fontSizeLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.paddingMedium,),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: AppConstants.paddingSmall,
              mainAxisSpacing: AppConstants.paddingSmall,
              childAspectRatio: 0.85,
            ),
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              final facility = facilities[index];
              return _buildFacilityItem(facility.name, facility.icon);
            },
          ),
        ],
      );
    });
  }

  Widget _buildFacilityItem(String name, String icon) {
    return Container(
      decoration: BoxDecoration(

        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIconData(icon),
              size: AppConstants.iconSizeMedium,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'wifi':
        return Icons.wifi;
      case 'parking':
        return Icons.local_parking;
      case 'breakfast':
        return Icons.free_breakfast;
      case 'pool':
        return Icons.pool;
      case 'gym':
        return Icons.fitness_center;
      case 'spa':
        return Icons.spa;
      case 'restaurant':
        return Icons.restaurant;
      case 'bar':
        return Icons.local_bar;
      default:
        return Icons.check_circle;
    }
  }
}