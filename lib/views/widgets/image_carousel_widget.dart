import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../viewmodels/property_controller.dart';

class ImageCarouselWidget extends StatelessWidget {
  const ImageCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyController>();

    return Obx(() {
      final images = controller.property.value.images;
      final currentIndex = controller.currentImageIndex.value;

      return SizedBox(
        height: AppConstants.imageCarouselHeight,
        child: Stack(
          children: [
            PageView.builder(
              itemCount: images.length,
              onPageChanged: controller.setImageIndex,
              itemBuilder: (context, index) {
                return Image.network(
                  images[currentIndex],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: AppColors.border,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.border,
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 64,
                        color: AppColors.iconGrey,
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                    AppColors.black.withValues(alpha: 0.5),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: AppConstants.paddingMedium,
              child: GestureDetector(
                onTap: controller.toggleFavorite,
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      controller.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isFavorite.value
                          ? AppColors.heartRed
                          : AppColors.textPrimary,
                      size: AppConstants.iconSizeMedium,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppConstants.paddingMedium,
              top: AppConstants.imageCarouselHeight / 2 - 24,
              child: _buildNavigationButton(
                Icons.chevron_left,
                controller.previousImage,
              ),
            ),
            Positioned(
              right: AppConstants.paddingMedium,
              top: AppConstants.imageCarouselHeight / 2 - 24,
              child: _buildNavigationButton(
                Icons.chevron_right,
                controller.nextImage,
              ),
            ),
            Positioned(
              bottom: AppConstants.paddingMedium,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: currentIndex == index ? 24 : 6,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.white
                          : AppColors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: AppConstants.iconSizeMedium,
        ),
      ),
    );
  }
}
