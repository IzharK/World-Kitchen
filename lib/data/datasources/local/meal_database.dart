import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'meal_database.g.dart';

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
  MealDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertFavorite(FavoritesCompanion favorite) =>
      into(favorites).insert(favorite);

  Future<void> deleteFavorite(String id) =>
      (delete(favorites)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<Favorite>> getAllFavorites() => select(favorites).get();

  Future<Favorite?> getFavoriteById(String id) =>
      (select(favorites)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'meals.db'));
    return NativeDatabase(file);
  });
}
