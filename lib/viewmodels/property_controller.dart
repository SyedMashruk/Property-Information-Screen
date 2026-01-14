import 'package:get/get.dart';

import '../models/property_model.dart';

class PropertyController extends GetxController {
  final RxInt currentImageIndex = 0.obs;
  final RxBool isFavorite = false.obs;
  late final Rx<PropertyModel> property;

  @override
  void onInit() {
    super.onInit();
    _loadPropertyData();
  }

  void _loadPropertyData() {
    property = PropertyModel(
      id: '1',
      name: 'Luxury Villa Resort',
      location: 'Bali, Indonesia',
      rating: 4.8,
      reviewCount: 1234,
      pricePerNight: 185,
      currency: '\$',
      description:
          'Experience ultimate luxury in this stunning beachfront villa featuring panoramic ocean views, private pool, and world-class amenities. Perfect for a romantic getaway or family vacation.',
      images: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=500&fit=crop',
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=500&fit=crop',
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&h=500&fit=crop',
        'https://images.unsplash.com/photo-1615460549969-36fa19521a4f?w=800&h=500&fit=crop',
      ],
      facilities: [
        FacilityModel(name: 'Free WiFi', icon: 'wifi'),
        FacilityModel(name: 'Parking', icon: 'parking'),
        FacilityModel(name: 'Breakfast', icon: 'breakfast'),
        FacilityModel(name: 'Pool', icon: 'pool'),
        FacilityModel(name: 'Gym', icon: 'gym'),
        FacilityModel(name: 'Spa', icon: 'spa'),
        FacilityModel(name: 'Restaurant', icon: 'restaurant'),
        FacilityModel(name: 'Bar', icon: 'bar'),
      ],
    ).obs;
  }

  void nextImage() {
    if (currentImageIndex.value < property.value.images.length - 1) {
      currentImageIndex.value++;
    } else {
      currentImageIndex.value = 0;
    }
  }

  void previousImage() {
    if (currentImageIndex.value > 0) {
      currentImageIndex.value--;
    } else {
      currentImageIndex.value = property.value.images.length - 1;
    }
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void setImageIndex(int index) {
    currentImageIndex.value = index;
  }

  void bookNow() {
    Get.snackbar(
      'Booking',
      'Booking functionality will be implemented',
      snackPosition: SnackPosition.TOP,
    );
  }
}
