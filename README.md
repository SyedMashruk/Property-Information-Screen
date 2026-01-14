# Property Booking App

A Flutter-based property booking application with a beautiful UI inspired by Booking.com and Agoda. Built with GetX state management and MVVM architecture.

## Demo

![App Demo](video/demo.webm)


## Features Implemented

- **Image Carousel** - Swipeable property gallery with 4+ images
- **Navigation Controls** - Left/right buttons for image navigation
- **Page Indicators** - Animated dots showing current image
- **Favorite Toggle** - Heart icon to mark properties as favorites
- **Property Information** - Name, location, rating, and reviews
- **Facilities Grid** - 8 facility icons (WiFi, Parking, Pool, etc.)
- **Price Display** - Prominent pricing with currency
- **Book Now Button** - Call-to-action button
- **Responsive UI** - Mobile-optimized layout
- **Clean Architecture** - MVVM pattern with GetX

## How to Run

### Prerequisites
- Flutter: `3.38.5`
- Dart: `3.10.4`

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd property_booking_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                          
├── bindings/
│   └── property_binding.dart          
├── core/
│   └── constants/
│       ├── app_colors.dart           
│       └── app_constants.dart      
├── models/
│   └── property_model.dart           
├── routes/
│   ├── app_pages.dart                 
│   └── app_routes.dart                
├── viewmodels/
│   └── property_controller.dart      
└── views/
    ├── screens/
    │   └── property_info_screen.dart  
    └── widgets/
        ├── facilities_widget.dart              
        ├── image_carousel_widget.dart          
        ├── price_booking_widget.dart          
        ├── property_description_widget.dart   
        └── property_header_widget.dart        
```

## Architecture

### MVVM Pattern
- **Model** (`models/`) - Data structures
- **View** (`views/`) - UI components
- **ViewModel** (`viewmodels/`) - Business logic

### State Management
- **GetX** - Reactive state management

### Key Folders

| Folder | Purpose |
|--------|---------|
| `bindings/` | Dependency injection setup |
| `core/constants/` | Colors, spacing, font sizes |
| `models/` | Data models for Property & Facilities |
| `routes/` | Navigation configuration |
| `viewmodels/` | Controllers managing app state |
| `views/screens/` | Full-screen pages |
| `views/widgets/` | Reusable UI components |

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  carousel_slider: ^4.2.1
  smooth_page_indicator: ^1.1.0
```