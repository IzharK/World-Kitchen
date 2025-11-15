# World Kitchen - Key Code Examples

## 1. Entity (Freezed)
```dart
@freezed
class MealDetail with _$MealDetail {
  const factory MealDetail({
    required String id,
    required String name,
    required String image,
    required String area,
    required String category,
    required String instructions,
    required List<String> ingredients,
    required List<String> measures,
    String? youtubeUrl,
    String? sourceUrl,
  }) = _MealDetail;
}
```

## 2. Use Case
```dart
class GetMealDetailUseCase extends UseCase<MealDetail, String> {
  final MealRepository repository;
  GetMealDetailUseCase(this.repository);

  @override
  Future<MealDetail> call(String id) => repository.getMealDetail(id);
}
```

## 3. Provider
```dart
class MealDetailProvider extends ChangeNotifier {
  final GetMealDetailUseCase getMealDetailUseCase;
  UiState<MealDetail> state = const UiState.loading();

  MealDetailProvider({required this.getMealDetailUseCase});

  Future<void> loadMealDetail(String id) async {
    state = const UiState.loading();
    notifyListeners();
    try {
      final meal = await getMealDetailUseCase(id);
      state = UiState.success(meal);
    } catch (e) {
      state = UiState.error(e.toString());
    }
    notifyListeners();
  }
}
```

## 4. Screen with Provider
```dart
Consumer<MealDetailProvider>(
  builder: (context, provider, _) {
    return provider.state.when(
      loading: () => CircularProgressIndicator(),
      success: (meal) => MealContent(meal: meal),
      error: (message) => ErrorWidget(message: message),
    );
  },
)
```

## 5. Dependency Injection
```dart
void setupDependencies() {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://www.themealdb.com/api/json/v1/1',
  ));
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<MealRemoteDatasource>(
    MealRemoteDatasourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerSingleton<GetMealDetailUseCase>(
    GetMealDetailUseCase(getIt<MealRepository>()),
  );
}
```

## 6. Navigation
```dart
final appRouter = GoRouter(
  initialLocation: '/countries',
  routes: [
    GoRoute(
      path: '/recipe/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return MealDetailScreen(id: id);
      },
    ),
  ],
);
```

## 7. Deep Linking
```dart
class GroceryNavigator {
  static Future<void> searchIngredient(String ingredient) async {
    final urls = [
      "https://www.zepto.co.in/search?query=$ingredient",
      "https://blinkit.com/s/?q=$ingredient",
      "https://www.swiggy.com/instamart/search?query=$ingredient",
    ];
    for (final url in urls) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
        return;
      }
    }
  }
}
```

## 8. Drift Database
```dart
class Favorites extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get area => text()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Favorites])
class MealDatabase extends _$MealDatabase {
  Future<void> insertFavorite(FavoritesCompanion favorite) =>
      into(favorites).insert(favorite);
}
```

## 9. DTO with json_serializable
```dart
@JsonSerializable()
class MealSummaryDto {
  @JsonKey(name: 'idMeal')
  final String idMeal;

  @JsonKey(name: 'strMeal')
  final String strMeal;

  factory MealSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryDtoFromJson(json);

  MealSummary toEntity() => MealSummary(
    id: idMeal,
    name: strMeal,
    image: strMealThumb,
  );
}
```

## 10. Main App Setup
```dart
void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<CountriesProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<RecipesProvider>()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}
```

