# World Kitchen - Architecture Documentation

## Overview
World Kitchen is a Flutter application built with **Clean Architecture** principles, featuring a meal discovery app powered by TheMealDB API.

## Tech Stack
- **Flutter 3.x** - UI Framework
- **Provider** - State Management
- **GetIt** - Dependency Injection
- **GoRouter** - Navigation
- **Dio** - HTTP Client
- **Drift** - Local Database (SQLite)
- **Freezed** - Data Classes & Union Types
- **json_serializable** - JSON Serialization

## Architecture Layers

### 1. **Core Layer** (`lib/core/`)
- **error/** - Custom exceptions (ServerException, CacheException, NetworkException)
- **usecase/** - Base UseCase classes
- **util/** - UI state management (UiState<T>)

### 2. **Domain Layer** (`lib/domain/`)
Pure Dart, no Flutter dependencies
- **entities/** - Business logic models (Area, MealSummary, MealDetail, Favorite)
- **repositories/** - Repository interfaces
- **usecases/** - Business logic operations

### 3. **Data Layer** (`lib/data/`)
- **datasources/**
  - **remote/** - Dio-based API calls to TheMealDB
  - **local/** - Drift database operations
- **models/** - DTOs with json_serializable
- **repositories/** - Repository implementations

### 4. **Presentation Layer** (`lib/presentation/`)
- **providers/** - ChangeNotifier providers for state management
- **screens/** - UI screens
- **widgets/** - Reusable widgets

### 5. **Dependency Injection** (`lib/di/`)
- **injector.dart** - GetIt setup for all dependencies

### 6. **Router** (`lib/router/`)
- **app_router.dart** - GoRouter configuration

## Key Features

### State Management
- **UiState<T>** - Generic state for loading, success, error
- **Providers** - ChangeNotifier for reactive updates

### Database
- **Drift** - Type-safe SQLite wrapper
- **Favorites Table** - Stores user's favorite meals

### Networking
- **Dio** - HTTP client with interceptors
- **TheMealDB API** - Free meal database API

### Navigation
- **GoRouter** - Type-safe routing with path parameters
- Routes: /countries, /recipes/:area, /recipe/:id, /favorites

### Deep Linking
- **GroceryNavigator** - Opens grocery apps (Zepto, Blinkit, Swiggy)

## Project Structure
```
lib/
├── core/
│   ├── error/
│   ├── usecase/
│   └── util/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── providers/
│   ├── screens/
│   └── widgets/
├── di/
├── router/
└── main.dart
```

## Running the App
```bash
flutter pub get
flutter pub run build_runner build
flutter run
```

## Code Generation
The project uses build_runner for:
- **Freezed** - Entity classes
- **json_serializable** - DTO serialization
- **Drift** - Database code

Run: `flutter pub run build_runner build --delete-conflicting-outputs`

