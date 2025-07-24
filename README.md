# List Items Pearl Coodesh

A Flutter app that displays a list of items fetched from a mock API, with favorite toggling, search, and local persistence.

## Why Riverpod?
Riverpod was chosen for state management because it is simple, robust, and highly testable. It allows for clear separation of business logic from UI, supports both synchronous and asynchronous state, and makes it easy to manage and share state across the app. Compared to alternatives like Bloc, Riverpod requires less boilerplate and is easier to scale for apps of this size, while still providing excellent performance and flexibility.

## Technologies Used
- Dart
- Flutter
- Riverpod (state management)
- shared_preferences (local storage)

## Installation & Usage

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd list_items_pearl_coodesh
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```

## Features
- List items with title, favorite toggle, timestamp, and colored tag ("New", "Old", "Hot")
- Search bar to filter items by title
- Badge counter for favorites in the app bar
- Favorites persisted locally using shared_preferences
- Optimized list rendering

---
This is a challenge by Coodesh.
