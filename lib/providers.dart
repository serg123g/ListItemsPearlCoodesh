import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'item_model.dart';
import 'mock_api.dart';

final itemsProvider = FutureProvider<List<ListItem>>((ref) async {
  final items = await MockApi.fetchItems();
  final prefs = await SharedPreferences.getInstance();
  final favIds = prefs.getStringList('favorites') ?? [];
  for (var item in items) {
    item.isFavorite = favIds.contains(item.id);
  }
  return items;
});

final searchProvider = StateProvider<String>((ref) => '');

final filteredItemsProvider = Provider<List<ListItem>>((ref) {
  final itemsAsync = ref.watch(itemsProvider);
  final search = ref.watch(searchProvider).toLowerCase();
  return itemsAsync.maybeWhen(
    data: (items) => items
        .where((item) => item.title.toLowerCase().contains(search))
        .toList(),
    orElse: () => [],
  );
});

final favoritesCountProvider = Provider<int>((ref) {
  final itemsAsync = ref.watch(itemsProvider);
  return itemsAsync.maybeWhen(
    data: (items) => items.where((i) => i.isFavorite).length,
    orElse: () => 0,
  );
});

final favoriteToggleProvider = Provider((ref) => (ListItem item) async {
      item.isFavorite = !item.isFavorite;
      final prefs = await SharedPreferences.getInstance();
      final favIds = prefs.getStringList('favorites') ?? [];
      if (item.isFavorite) {
        favIds.add(item.id);
      } else {
        favIds.remove(item.id);
      }
      await prefs.setStringList('favorites', favIds.toSet().toList());
      ref.invalidate(itemsProvider);
    });
