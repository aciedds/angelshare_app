# Rules & Arsitektur Project (Clean Architecture & State Management)

Dokumen ini berisi pedoman arsitektur, aturan penamaan, dan tata cara penulisan kode untuk project **Angel's Share**. Semua agen dan developer harus mematuhi aturan ini saat melakukan modifikasi atau menambahkan fitur baru.

---

## 1. Aturan Umum & Arsitektur (Clean Architecture)
Project ini menerapkan **Clean Architecture** dengan struktur **Feature-First** (fitur terisolasi di dalam direktorinya masing-masing). Setiap fitur dibagi menjadi tiga layer utama:
1. **Data Layer**:
   - Berisi `datasources`, `models` (DTO/db entities), dan `repositories` implementasi.
2. **Domain Layer**:
   - Berisi cetak biru arsitektur: `entities` murni, kontrak `repositories` abstrak, dan `usecases`.
3. **Presentation Layer**:
   - Berisi UI `pages`, `widgets`, dan `notifier` (ViewModel).

---

## 2. Struktur Berkas (Folder Structure) & Aturan Penamaan

Setiap fitur baru wajib diletakkan di bawah direktori `lib/features/{feature_name}/` dengan mengikuti struktur subfolder serta aturan penamaan berkas secara konsisten:

```text
lib/features/{feature_name}/
│
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   │   └── {feature_name}_local_data_source.dart
│   │   └── remote/
│   │       └── {feature_name}_remote_data_source.dart
│   └── repositories/
│       └── {feature_name}_repository_impl.dart
│
├── domain/
│   ├── models/
│   │   └── entities/
│   │       └── {entity_name}_entity.dart
│   ├── repositories/
│   │   └── {feature_name}_repository.dart
│   └── usecases/
│       └── {action_name}_usecase.dart
│
├── presentation/
│   ├── notifier/
│   │   ├── {feature_name}_notifier.dart
│   │   └── {feature_name}_state.dart
│   ├── pages/
│   │   └── {feature_name}_page.dart (atau {feature_name}_tab.dart)
│   └── widgets/
│       └── {widget_name}_card.dart (widget khusus pendukung page)
│
└── {feature_name}_provider.dart (file Provider Root untuk DI Riverpod)
```

### Aturan Penamaan (Naming Conventions):
- **Format Dasar**:
  - **Nama File & Folder**: Wajib menggunakan `snake_case` (contoh: `get_cart_items_usecase.dart`, `cart_tab.dart`).
  - **Nama Class**: Wajib menggunakan `PascalCase` (contoh: `GetCartItemsUseCase`, `CartNotifier`).
- **Repository**:
  - Kontrak (interface) abstrak di Domain Layer: `{FeatureName}Repository` (contoh: `CartRepository`).
  - Implementasi di Data Layer: `{FeatureName}RepositoryImpl` (contoh: `CartRepositoryImpl`).
- **Use Case**:
  - Nama file dan class harus spesifik menunjukkan aksinya dan diakhiri dengan `UseCase` (contoh: `AddToCartUseCase` di file `add_to_cart_usecase.dart`).
- **Notifier (ViewModel)**:
  - Kelas pengelola logika state UI harus diakhiri dengan suffix `Notifier` (contoh: `CartNotifier`).
- **State**:
  - Kelas model state pembungkus UI harus diakhiri dengan suffix `State` (contoh: `CartState`).
- **Provider**:
  - Instance global Riverpod Provider diletakkan di `{feature_name}_provider.dart` dan diberi nama berakhiran `Provider` (contoh: `cartNotifierProvider`, `addToCartUseCaseProvider`).

---

## 3. Komunikasi Antar Layer (Exclusively Use Cases)
- **Aturan Mutlak**: Notifier (Presentation Layer) **TIDAK BOLEH** berinteraksi atau bergantung langsung ke Repository.
- Semua pemanggilan method ke repository **WAJIB** melalui Use Case yang spesifik (Single Responsibility Principle).
- Setiap Use Case hanya boleh bertanggung jawab atas satu aksi/operasi bisnis saja (mempunyai satu method `execute`).

---

## 4. Pola Menggunakan DataState & ViewState

### A. DataState (Data & Domain Layer)
Semua fungsi asynchronous di dalam repository dan Use Cases harus mengembalikan `Future<DataState<T>>` untuk membungkus hasil operasi (sukses atau gagal) secara type-safe.

#### Definisi DataState:
Gunakan sealed class `DataState<T>` (`lib/core/providers/data_state.dart`):
- `DataState.success(T data)`: Saat operasi berhasil.
- `DataState.failure(Exception error)`: Saat terjadi exception.

#### Contoh Implementasi Repository / Use Case:
```dart
// Di dalam Domain Repository contract
abstract class CartRepository {
  Future<DataState<List<CartItemEntity>>> getCartItems();
}

// Di dalam Use Case
class GetCartItemsUseCase {
  final CartRepository _repository;
  GetCartItemsUseCase({required CartRepository repository}) : _repository = repository;

  Future<DataState<List<CartItemEntity>>> execute() {
    return _repository.getCartItems();
  }
}
```

---

### B. ViewState (Presentation Layer)
Semua StateNotifier yang mengelola state UI wajib bertipe `StateNotifier<ViewState<StateClass>>` di mana `StateClass` didefinisikan menggunakan `@freezed`.

#### Definisi ViewState:
Gunakan sealed class `ViewState<T>` (`lib/core/providers/view_state.dart`):
- `ViewState.initial({T? data})`
- `ViewState.loading({T? data})`
- `ViewState.success({required T data})`
- `ViewState.error({required String message, T? data})`

Setiap konstruktor di `ViewState` menerima optional `data` parameter untuk mempertahankan state data yang sudah termuat di UI saat notifier berpindah ke status `.loading` atau `.error`.

#### Contoh Definisi State & Notifier:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/core/providers/data_state.dart';

part 'cart_provider.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemEntity> cartItems,
  }) = _CartState;
}

class CartNotifier extends StateNotifier<ViewState<CartState>> {
  final GetCartItemsUseCase _getCartItemsUseCase;

  CartNotifier({
    required GetCartItemsUseCase getCartItemsUseCase,
  })  : _getCartItemsUseCase = getCartItemsUseCase,
        super(const ViewState.initial(data: CartState())) {
    loadCart();
  }

  Future<void> loadCart() async {
    final currentData = state.data ?? const CartState();
    state = ViewState.loading(data: currentData);

    final result = await _getCartItemsUseCase.execute();
    result.when(
      success: (items) {
        final updatedData = currentData.copyWith(cartItems: items);
        state = ViewState.success(data: updatedData);
      },
      failure: (error) {
        state = ViewState.error(message: error.toString(), data: currentData);
      },
    );
  }
}
```

---

### C. Konsumsi State di View (UI Page/Widget)
Di dalam Widget, gunakan `ref.watch(provider)` untuk memantau status `ViewState` dan handle perubahan UI secara seragam.

#### Contoh Konsumsi State:
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final viewState = ref.watch(cartNotifierProvider);
  final state = viewState.data ?? const CartState();

  // Tampilkan loading spinner jika status sedang loading dan data lokal kosong
  if (viewState is ViewStateLoading<CartState> && state.cartItems.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }

  final errorMessage = viewState.maybeWhen(
    error: (msg, _) => msg,
    orElse: () => null,
  );

  return Column(
    children: [
      if (errorMessage != null)
        Text('Error: $errorMessage', style: TextStyle(color: Colors.red)),
      Expanded(
        child: ListView.builder(
          itemCount: state.cartItems.length,
          itemBuilder: (context, index) => CartItemCard(item: state.cartItems[index]),
        ),
      ),
    ],
  );
}
```

---

## 5. Pedoman Pengujian (Testing)
- Seluruh Mock / Fake Repository di dalam file test wajib mematuhi method signature yang mengembalikan `Future<DataState<T>>` menggunakan wrapper `DataState.success(...)` atau `DataState.failure(...)`.
- Untuk mencegah error loop tak terbatas pada widget test, hindari pemanggilan `tester.pumpAndSettle()` pada halaman yang berisi animasi looping tidak terbatas (seperti `GlowingOrb`). Sebagai gantinya, gunakan `tester.pump(Duration(milliseconds: X))`.

---

## 6. Dependency Injection (DI) Pattern
Project ini tidak menggunakan Service Locator seperti `get_it`. Sebagai gantinya, Dependency Injection dilakukan secara deklaratif menggunakan **Riverpod Providers** di dalam file `{feature_name}_provider.dart` masing-masing fitur.

### Alur Dependency Injection:
1. **Data Source / DAO Provider**: Provider dasar yang mengakses data dari remote (Firebase/API) atau database lokal (Drift).
2. **Repository Provider**: Menginisialisasi implementasi repository dengan menyuntikkan (inject) Data Source / DAO provider.
3. **Use Case Providers**: Menginisialisasi use case dengan menyuntikkan Repository provider.
4. **Notifier Provider**: Menyuntikkan seluruh Use Case yang dibutuhkan ke dalam constructor Notifier.

#### Contoh DI deklaratif (`auth_provider.dart`):
```dart
// 1. Data Source
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) => AuthRemoteDataSource());

// 2. Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authRemoteDataSourceProvider);
  final localDao = ref.watch(uiWidgetDaoProvider);
  return AuthRepositoryImpl(remoteDataSource: remote, uiWidgetDao: localDao);
});

// 3. Use Case
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository: repository);
});

// 4. Notifier / View Model
final authNotifierProvider = StateNotifierProvider<AuthNotifier, ViewState<AuthState>>((ref) {
  final signInUseCase = ref.watch(signInUseCaseProvider);
  return AuthNotifier(signInUseCase: signInUseCase, ref: ref);
});
```

---

## 7. Package Utama yang Digunakan (Core Stack)
- **`hooks_riverpod`**: Digunakan untuk State Management dan Dependency Injection (DI) murni.
- **`flutter_hooks`**: Digunakan untuk mengelola state lokal UI / controller (seperti `TextEditingController` atau `ScrollController`) menggunakan Hooks tanpa membuat Stateful Widget.
- **`flutter_screenutil`**: Digunakan untuk adaptasi desain responsif (ukuran font, margin, padding, tinggi/lebar).
- **`drift` & `sqlite3_flutter_libs`**: ORM lokal berbasis SQLite untuk penyimpanan offline terstruktur (seperti item keranjang belanja dan widget configurations).
- **`dio`**: Client HTTP utama untuk pemanggilan REST API (seperti data koktail dari TheCocktailDB).
- **`firebase_core` & `cloud_firestore` & `firebase_auth`**: Layanan backend utama untuk menyimpan metadata layout (`appearance`) dan sinkronisasi cloud.
- **`freezed` & `freezed_annotation`**: Pembuatan model data immutable, sealed class `ViewState`/`DataState`, serta method helper `copyWith` secara otomatis.
- **`json_serializable`**: Otomatisasi konversi model DTO dari/ke JSON.

---

## 8. Aturan UI & Styling (Theme Preset & Glassmorphism)
Desain visual project ini bertema premium dark mode (Obsidian, Deep Purple/Gold) dengan Glassmorphism dan efek Neon.

### Panduan Desain UI:
1. **Dynamic Color Theme**:
   - Dilarang keras menggunakan warna hardcoded (seperti `Colors.amber` atau `Colors.red`).
   - Warna harus dibaca dinamis melalui `Theme.of(context).extension<AppThemeColors>()` (menyediakan `.primary`, `.accent`, `.muted`, `.backgroundObsidian`, `.backgroundDeep`, `.glassWhite`, `.glassBorder`).
2. **Glassmorphism**:
   - Gunakan widget `GlassContainer` (`lib/core/components/atoms/glass_container.dart`) untuk container/card, lengkapi dengan `borderColor: themeColors.glassBorder` dan `backgroundColor: themeColors.glassWhite`.
3. **Responsive Layout**:
   - Gunakan ScreenUtil untuk dimensi (`.w`, `.h`, `.r`, `.sp`) agar layout tetap proporsional di berbagai ukuran layar (contoh: `SizedBox(height: 16.h)`, `fontSize: 14.sp`, `radius: 12.r`).
4. **Typography & Neon Text**:
   - Gunakan `NeonText` (`lib/core/components/atoms/neon_text.dart`) untuk judul header utama yang bercahaya (glow).

---

## 9. Database & Code Generation
- Aplikasi menggunakan SQLite terenkripsi melalui package **Drift**.
- Jika Anda mengubah skema database (pada berkas `.drift` atau class table Drift) atau model Freezed/JsonSerializable:
  - Wajib menjalankan generator kode dengan perintah:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
  - Selalu pastikan hasil generasi bebas error sebelum melakukan commit.
