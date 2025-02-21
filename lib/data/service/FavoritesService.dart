import 'package:hive/hive.dart';

class FavoritesService {
  static const _boxName = 'favoriteImages';

  Future<void> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<String>(_boxName);
    }
  }

  Future<void> addFavourite(String image) async {
    await _openBox();
    final box = Hive.box<String>(_boxName);
    if (!box.values.contains(image)) {
      await box.add(image);
    }
  }

  Future<void> removeFavourite(String item) async {
    await _openBox();
    final box = Hive.box<String>(_boxName);
    final key = box.keys.firstWhere((key) => box.get(key) == item);
    await box.delete(key);
  }

  Future<List<String>> getFavourites() async {
    await _openBox();
    final box = Hive.box<String>(_boxName);
    return box.values.toList();
  }
}
