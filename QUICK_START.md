# World Kitchen - Quick Start Guide

## Prerequisites
- Flutter 3.x installed
- Dart 3.x
- Android SDK or iOS SDK (for running on device/emulator)

## Setup Instructions

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App
```bash
flutter run
```

## Project Structure Overview

```
lib/
├── core/              # Error handling, base classes, utilities
├── domain/            # Business logic (entities, repositories, use cases)
├── data/              # Data sources, DTOs, repository implementations
├── presentation/      # UI (screens, providers, widgets)
├── di/                # Dependency injection setup
├── router/            # Navigation configuration
└── main.dart          # App entry point
```

## Key Features

### 🌍 Browse Meals by Country
- View all available countries/areas
- See meals from each country

### 🍽️ Recipe Details
- View complete recipe information
- See ingredients and measurements
- Read cooking instructions

### ❤️ Favorites
- Save favorite meals locally
- Quick access to saved recipes

### 🛒 Grocery Shopping
- Click "Buy" on ingredients
- Opens grocery apps (Zepto, Blinkit, Swiggy)

## Architecture Highlights

- **Clean Architecture** - Separation of concerns
- **Provider** - Reactive state management
- **GetIt** - Service locator for DI
- **GoRouter** - Type-safe navigation
- **Drift** - Type-safe SQLite database
- **Freezed** - Immutable data classes

## API Integration

Uses **TheMealDB API** (free, no authentication required)
- Endpoints: /list.php, /filter.php, /lookup.php
- Base URL: https://www.themealdb.com/api/json/v1/1

## Troubleshooting

### Build Issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Database Issues
- Delete app data and reinstall
- Database is stored in app documents directory

### API Issues
- Check internet connection
- Verify TheMealDB API is accessible

## Next Steps
- Customize theme colors in main.dart
- Add more features (ratings, reviews, etc.)
- Implement offline mode
- Add search functionality

