# 🍸 Angel's Share (angelshare_app)

> **Angel's Share** is a premium, high-fidelity Flutter mobile application that serves as a dynamic, custom-themed cocktail recipe catalog. It integrates real-time recipe fetching from **TheCocktailDB API** with robust offline caching, local persistent storage, state management via **Riverpod**, and a highly interactive **UI Control Center** to modify UI presets, colors, layouts, and ambient aesthetics on the fly.

---

## ✨ Key Features

### 🎨 1. Dynamic UI skins & Thematic Presets
Angel's Share features a dynamic skinning engine that rebuilds the UI theme instantly from state or native database configurations:
*   **🏆 Gold Preset**: Classic dark obsidian background (`#050505`) with premium luxury gold accents (`#C5A059`, `#E5C287`).
*   **👾 Cyberpunk Preset**: Dark violet workspace (`#0A0915`) featuring high-octane neon cyan (`#00F5D4`) and hot pink (`#9D4EDD`) glowing highlights.
*   **🌲 Emerald Preset**: Elegant forest background (`#0A1C18`) paired with warm amber and earthy green hues.
*   **🎨 Custom Preset**: Allows custom hex values for primary, accent, muted, background obsidian, and deep background colors saved dynamically in the local database.

### 🌌 2. Ambient Visual Effects
*   **Glowing Ambient Orbs**: Float dynamically in the background layer of the app. Toggled and styled in real-time.
*   **Glassmorphism Container**: Custom `GlassContainer` elements utilizing backdrop filtering, semi-transparent borders, and deep drop-shadows to ensure visual premiumness.

### 🍸 3. Adaptive Cocktail Catalog
Browse recipes through multiple layouts, which are toggled dynamically in the UI configuration database:
*   **3D Carousel**: Interactive swipeable cards with three-dimensional perspective scaling.
*   **2-Column Grid**: Clean, highly readable grid display of items.
*   **List View**: Sequential card list presenting recipe cards.
*   **Dynamic Categories Slider**: Slideable selector at the top showing categories fetched from the API with cache support.

### 🧬 4. Magical Synthesizer Tab
*   An experimental tab allowing users to target specific categories or random selections to synthesize random cocktail recipes using state machines.

### 🛒 5. Persistent Offline Cart & Checkout
*   Full persistent shopping cart using Drift (Reactive SQLite).
*   Add, edit quantities, and track order histories locally on device.

### ❤️ 6. Favorites & History Manager
*   Save custom recipes and cocktails to a persistent favorite list.
*   Keeps a local history log of recently generated formulas.

### 🛡️ 7. Firebase Authentication
*   Secure login and sign-up flows using Firebase Auth provider integrations, including test chip helpers for development workflows.

### ⚙️ 8. UI Control Center (Developer Panel)
*   A draggable developer sheet providing on-the-fly customization:
    *   Change active theme skin presets.
    *   Customize welcome greeting text header.
    *   Toggle layout formats (Carousel, Grid, List) dynamically.
    *   Modify synthesizer search target filters.
    *   Reorder page widgets/sections using Up/Down arrow controllers (toggling sort order in Drift DB).
    *   Adjust widget color slots (`primary`, `secondary`, `accent`, `muted`).

---

## 🛠️ Tech Stack & Architecture

This project is built using a strict modular **Clean Architecture** model with Domain-Driven Design (DDD) principles:

```
lib/
├── core/                         # Shared utilities, database, theme configs
│   ├── components/               # Atomic Design: Atoms (Orbs, Glass, Neon) & Molecules
│   ├── database/                 # Drift Database connection & UI Config DAOs
│   ├── network/                  # Dio HTTP Client with LogInterceptors
│   ├── providers/                # Riverpod Global Configs & ViewStates
│   └── theme/                    # Central Design System tokens (AppTheme, Sizes)
│
└── features/                     # Feature modules following Clean Architecture
    ├── auth/                     # Auth feature (Data, Domain, Presentation)
    ├── cart/                     # Cart & Order History persistence management
    ├── favorites/                # Favorites & History grids
    └── menu_catalog/             # Catalog fetching, details sheets, Synthesizer tabs
```

*   **Framework**: Flutter (Dart SDK `^3.8.1`)
*   **State Management**: Hooks Riverpod (`hooks_riverpod`, `flutter_hooks`)
*   **Local SQLite Engine**: Drift (`drift`, `drift_dev`, `sqlite3_flutter_libs`)
*   **HTTP Service**: Dio Client (`dio`)
*   **Database Generator**: `build_runner`
*   **Responsive Layouts**: `flutter_screenutil`
*   **Backend & Security**: Firebase Core & Firebase Auth

---

## 🗄️ Database Tables Schema

Local persistence is managed using **Drift** (SQLite). The database schema consists of six tables:

| Table Name | Description | Key Fields |
| :--- | :--- | :--- |
| `ui_widget_table` | Dynamic UI elements configuration | `id` (PK), `name`, `isEnabled`, `sortOrder`, `colorSlot`, `metadata` (JSON) |
| `favorite_table` | Saved favorite recipes | `id` (PK), `drinkId`, `name`, `imageUrl`, `category`, `savedAt` |
| `cart_table` | Pending shopping cart items | `id` (PK), `drinkId`, `name`, `imageUrl`, `quantity`, `price` |
| `order_history_table` | Log of checked out orders | `id` (PK), `orderId`, `checkoutDate`, `itemsJson`, `totalAmount` |
| `alcohol_table` | Cached list of cocktails by category | `id` (PK), `drinkId`, `name`, `imageUrl`, `category` |
| `alcohol_detail_table` | Cached cocktail recipes formulas | `id` (PK), `drinkId`, `name`, `recipeJson`, `fetchedAt` |

---

## 🚀 Getting Started

Follow these steps to run the application on your local machine:

### 📋 Prerequisites
1. Ensure you have the Flutter SDK installed (`>= 3.8.1`). Run `flutter --version` to verify.
2. Setup Cocoapods if building for iOS.

### 1. Clone & Fetch Dependencies
Run the following commands in the project directory:
```bash
flutter pub get
```

### 2. Generate Drift Database Code
Since this project uses Drift and Freezed, you must run the build runner to generate the database schema and model serialization classes (`*.g.dart` and `*.freezed.dart`):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App
Launch the app on a connected emulator, simulator, or physical device:
```bash
flutter run
```

---

## 🔧 Developer Customization

To access the **UI Control Center** inside the app:
1. Tap the **Settings/Control** icon in the app bar or bottom navigation (depending on layout setup).
2. Use the interactive controls to change layout types, drag to adjust positions, and toggle themes.
3. Observe how the app interface changes in real-time as state flows reactively from the local sqlite cache.
