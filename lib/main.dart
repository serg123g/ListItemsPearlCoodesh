import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/item_model.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Items Pearl Coodesh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ItemsPage(),
    );
  }
}

class ItemsPage extends ConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(filteredItemsProvider);
    final favCount = ref.watch(favoritesCountProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.favorite),
              ),
              if (favCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text('$favCount',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by title...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) =>
                  ref.read(searchProvider.notifier).state = value,
            ),
          ),
        ),
      ),
      body: itemsAsync.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: itemsAsync.length,
              itemBuilder: (context, i) {
                final item = itemsAsync[i];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(_timeAgo(item.createdAt)),
                  leading: CircleAvatar(
                    backgroundColor: tagColor(item.tag),
                    child: Text(tagLabel(item.tag)),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                        item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: item.isFavorite ? Colors.red : null),
                    onPressed: () => ref.read(favoriteToggleProvider)(item),
                  ),
                );
              },
            ),
    );
  }
}

String _timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inMinutes < 1) return 'just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours} h ago';
  return '${diff.inDays} d ago';
}
