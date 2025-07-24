## Development Process

### 1. Understanding the Requirements
- Built a Flutter app to display a list of items from a mock API.
- Features: favorite toggle, search, badge counter, local persistence, and optimized list rendering.

### 2. Assumptions
- Mock API is local and does not require authentication.
- Items are static per launch; only favorite state changes.
- Tags ("New", "Old", "Hot") are assigned for demonstration.
- Only favorite state is persisted locally.
- App targets mobile but is compatible with other Flutter platforms.

### 3. Technical Decisions & Reasoning

#### State Management: Riverpod
- Chosen for simplicity, robustness, and testability.
- Less boilerplate than Bloc, easier to scale for this app size.
- Supports both sync and async state, and clear separation of logic and UI.

#### Project Structure
- `models/item_model.dart`: Data model.
- `mock_api.dart`: Simulated API.
- `providers.dart`: Riverpod providers.
- `main.dart`: UI and app entry point.
- Modular structure for maintainability.

#### Mock API
- Simulates network delay and generates sample data.
- Allows UI development without a backend.

#### Persistence: shared_preferences
- Simple key-value storage for favorite IDs.
- Well-supported and sufficient for this use case.

#### UI Decisions
- `ListView.builder` for efficient rendering.
- AppBar badge counter using Stack.
- Real-time search with Riverpod.
- Favorite toggle updates state and persists immediately.

#### Optimization
- Efficient list rendering and minimal UI rebuilds using Riverpod.

### 4. Development Steps
1. Project setup and dependency installation.
2. Model and mock API implementation.
3. State management with Riverpod providers.
4. Persistence with shared_preferences.
5. UI implementation: AppBar, badge, search, list, favorite toggle.
6. Testing and optimization.
7. Documentation.

### 5. Summary
- Riverpod chosen for state management.
- shared_preferences for persistence.
- Modular, maintainable codebase.
- All Coodesh challenge requirements met.

## Technologies Used
- Dart
- Flutter
- Riverpod (state management)
- shared_preferences (local storage)

## Installation & Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/serg123g/ListItemsPearlCoodesh
   cd ListItemsPearlCoodesh
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

## Snapshots
<img width="401" height="705" alt="image" src="https://github.com/user-attachments/assets/cb27b223-1d26-40b0-973d-a075368de446" />
<img width="402" height="747" alt="image" src="https://github.com/user-attachments/assets/015fa92f-9f00-4680-a3a0-e48bef73c4db" />

---
This is a challenge by Coodesh.
