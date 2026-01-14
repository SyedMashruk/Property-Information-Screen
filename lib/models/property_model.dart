class PropertyModel {
  final String id;
  final String name;
  final String location;
  final double rating;
  final int reviewCount;
  final double pricePerNight;
  final String currency;
  final String description;
  final List<String> images;
  final List<FacilityModel> facilities;

  PropertyModel({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.currency,
    required this.description,
    required this.images,
    required this.facilities,
  });
}

class FacilityModel {
  final String name;
  final String icon;

  FacilityModel({
    required this.name,
    required this.icon,
  });
}