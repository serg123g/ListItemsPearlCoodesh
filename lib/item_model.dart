import 'package:flutter/material.dart';

enum ItemTag { newItem, old, hot }

class ListItem {
  final String id;
  final String title;
  final DateTime createdAt;
  final ItemTag tag;
  bool isFavorite;

  ListItem({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.tag,
    this.isFavorite = false,
  });
}

Color tagColor(ItemTag tag) {
  switch (tag) {
    case ItemTag.newItem:
      return Colors.green;
    case ItemTag.old:
      return Colors.grey;
    case ItemTag.hot:
      return Colors.red;
  }
}

String tagLabel(ItemTag tag) {
  switch (tag) {
    case ItemTag.newItem:
      return 'New';
    case ItemTag.old:
      return 'Old';
    case ItemTag.hot:
      return 'Hot';
  }
}
