import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../widgets/image_carousel_widget.dart';
import '../widgets/property_header_widget.dart';
import '../widgets/property_description_widget.dart';
import '../widgets/facilities_widget.dart';
import '../widgets/price_booking_widget.dart';

class PropertyInfoScreen extends StatelessWidget {
  const PropertyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ImageCarouselWidget(),
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(
                      AppConstants.paddingMedium,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PropertyHeaderWidget(),
                        SizedBox(height: AppConstants.paddingLarge),
                        Divider(color: AppColors.divider),
                        SizedBox(height: AppConstants.paddingMedium),
                        PropertyDescriptionWidget(),
                        SizedBox(height: AppConstants.paddingLarge),
                        Divider(color: AppColors.divider),
                        SizedBox(height: AppConstants.paddingMedium),
                        FacilitiesWidget(),
                        SizedBox(height: AppConstants.paddingMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const PriceBookingWidget(),
        ],
      ),
    );
  }
}