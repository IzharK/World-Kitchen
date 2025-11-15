# 🍽️ World Kitchen - Flutter Meal Discovery App

A production-ready Flutter application demonstrating **Clean Architecture** with Provider, GetIt, GoRouter, Dio, and Drift.

## ✨ Features

- 🌍 Browse meals by country/area
- 🍽️ View detailed recipe information with ingredients
- ❤️ Save favorite meals locally
- 🛒 Deep link to grocery apps (Zepto, Blinkit, Swiggy)
- 📱 Responsive Material 3 UI
- 🔄 Reactive state management
- 💾 Local SQLite database
- 🚀 Type-safe navigation

## 🏗️ Architecture

**5-Layer Clean Architecture:**
- **Core** - Error handling, base classes, utilities
- **Domain** - Business logic, entities, use cases
- **Data** - API integration, local storage, DTOs
- **Presentation** - UI, state management, providers
- **DI** - Dependency injection setup

## 🛠️ Tech Stack

| Component | Package | Version |
|-----------|---------|---------|
| State Management | Provider | 6.1.0 |
| DI Container | GetIt | 7.6.0 |
| Navigation | GoRouter | 14.0.0 |
| HTTP Client | Dio | 5.4.0 |
| Database | Drift | 2.14.0 |
| Data Classes | Freezed | 2.4.5 |
| JSON | json_serializable | 6.7.1 |
| Deep Linking | url_launcher | 6.2.0 |

## 🚀 Quick Start

```bash
# 1. Get dependencies
flutter pub get

# 2. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run the app
flutter run
```

## 📁 Project Structure

```
lib/
├── core/              # Error handling, base classes
├── domain/            # Business logic & entities
├── data/              # API & database integration
├── presentation/      # UI & state management
├── di/                # Dependency injection
├── router/            # Navigation setup
└── main.dart          # App entry point
```

## 📚 Documentation

- **ARCHITECTURE.md** - Detailed architecture explanation
- **QUICK_START.md** - Setup and running instructions
- **CODE_EXAMPLES.md** - Key code patterns
- **IMPLEMENTATION_SUMMARY.md** - What was implemented
- **PROJECT_OVERVIEW.md** - Complete overview
- **FILES_CREATED.md** - All files created

## 🎯 Key Highlights

✅ **Clean Architecture** - Strict separation of concerns
✅ **Type-Safe** - Freezed entities, json_serializable DTOs
✅ **Reactive** - Provider for state management
✅ **Database** - Drift for type-safe SQLite
✅ **Navigation** - GoRouter with path parameters
✅ **Error Handling** - Custom exceptions, error states
✅ **Code Generation** - Freezed, json_serializable, Drift
✅ **No Lint Errors** - Production-ready code quality

## 🔌 API Integration

Uses **TheMealDB API** (free, no authentication)
- Base URL: https://www.themealdb.com/api/json/v1/1
- Endpoints: /list.php, /filter.php, /lookup.php

## 📊 Project Stats

- **30+** source files
- **1500+** lines of code
- **4** providers
- **4** screens
- **7** use cases
- **4** entities
- **0** lint errors

## 🎓 Learning Value

Perfect for learning:
- Clean Architecture in Flutter
- Provider state management
- Dependency injection patterns
- Type-safe routing
- Local database with Drift
- API integration with Dio
- Code generation with build_runner

## ✅ Build Status

```
✅ No lint errors
✅ No type errors
✅ All code compiles
✅ Ready to run
```

## 📝 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Feel free to fork, modify, and use this project as a reference for your Flutter applications.

---

**Built with ❤️ using Flutter & Clean Architecture**
