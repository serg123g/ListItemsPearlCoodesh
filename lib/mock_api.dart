import 'dart:async';
import 'item_model.dart';

class MockApi {
  static Future<List<ListItem>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final now = DateTime.now();
    return List.generate(20, (i) {
      return ListItem(
        id: 'item_$i',
        title: 'Item ${i + 1}',
        createdAt: now.subtract(Duration(minutes: i * 5)),
        tag: i % 3 == 0
            ? ItemTag.hot
            : i % 3 == 1
                ? ItemTag.newItem
                : ItemTag.old,
      );
    });
  }
}
