import 'package:get/get.dart';
import '../views/screens/property_info_screen.dart';
import '../viewmodels/property_controller.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.propertyInfo,
      page: () => const PropertyInfoScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PropertyController>(
              () => PropertyController(),
        );
      }),
    ),
  ];
}