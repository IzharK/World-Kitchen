# 🚀 Getting Started with World Kitchen

## Prerequisites

Before you begin, ensure you have:
- Flutter 3.x installed
- Dart 3.x
- Android SDK or iOS SDK
- A code editor (VS Code, Android Studio, or IntelliJ)

## Installation Steps

### Step 1: Navigate to Project Directory
```bash
cd world_kitchen
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

This will download all required packages including:
- Provider, GetIt, GoRouter, Dio, Drift, Freezed, etc.

### Step 3: Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates code for:
- Freezed entities
- json_serializable DTOs
- Drift database

### Step 4: Run the App
```bash
flutter run
```

Or run on a specific device:
```bash
flutter run -d <device_id>
```

## Verify Installation

Check that everything is working:
```bash
flutter analyze
```

Expected output:
```
Analyzing world_kitchen...
No issues found! (ran in 2.5s)
```

## Project Structure

```
world_kitchen/
├── lib/
│   ├── core/              # Error handling, base classes
│   ├── domain/            # Business logic, entities
│   ├── data/              # API, database, DTOs
│   ├── presentation/      # UI, providers, screens
│   ├── di/                # Dependency injection
│   ├── router/            # Navigation
│   └── main.dart          # App entry point
├── pubspec.yaml           # Dependencies
└── README.md              # Project overview
```

## Key Features to Try

### 1. Browse Countries
- App starts with countries list
- Tap any country to see meals

### 2. View Recipes
- See all meals from selected country
- Tap meal to view details

### 3. Recipe Details
- View ingredients and measurements
- Read cooking instructions
- Watch YouTube video (if available)

### 4. Add to Favorites
- Tap heart icon to save meal
- Saved locally in SQLite database

### 5. Search Ingredients
- Tap "Buy" button on ingredients
- Opens grocery app (Zepto, Blinkit, or Swiggy)

### 6. View Favorites
- Access from bottom navigation
- View all saved meals
- Remove from favorites

## Troubleshooting

### Issue: Build fails
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Database errors
- Delete app and reinstall
- Database is stored in app documents directory

### Issue: API not responding
- Check internet connection
- Verify TheMealDB API is accessible
- Check Dio logs in console

## Development Commands

### Run with verbose output
```bash
flutter run -v
```

### Run on specific device
```bash
flutter devices  # List devices
flutter run -d <device_id>
```

### Build APK
```bash
flutter build apk --release
```

### Build iOS
```bash
flutter build ios --release
```

## Code Generation

If you modify entities or DTOs:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or watch for changes:
```bash
flutter pub run build_runner watch
```

## Documentation

- **README.md** - Project overview
- **ARCHITECTURE.md** - Architecture details
- **CODE_EXAMPLES.md** - Code patterns
- **QUICK_START.md** - Quick reference
- **COMPLETION_REPORT.md** - What was built

## API Information

**TheMealDB API**
- Base URL: https://www.themealdb.com/api/json/v1/1
- Free to use, no authentication required
- Endpoints:
  - `/list.php?a=list` - Get all areas
  - `/filter.php?a={area}` - Get meals by area
  - `/lookup.php?i={id}` - Get meal details

## Support

For issues or questions:
1. Check the documentation files
2. Review the code examples
3. Check Flutter documentation
4. Review package documentation

## Next Steps

1. ✅ Run the app
2. ✅ Explore the features
3. ✅ Review the code structure
4. ✅ Customize as needed
5. ✅ Deploy to app stores

---

**Happy coding! 🎉**

