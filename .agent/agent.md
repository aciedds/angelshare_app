# Product Requirement Document (PRD) - Phase 1
## Project Name: Angel's Share - Interactive Futuristic Menu App
**Author:** Senior Fullstack Developer
**Version:** 1.2 (Phase 1 Baseline - Final Directory Structure)
**Status:** Approved / Ready for Development
**Date:** June 4, 2026

---

## 1. Executive Summary & Vision
**Angel's Share** adalah aplikasi buku menu digital premium yang dirancang khusus untuk bar eksklusif bertema *Futuristik Fantasy*. Aplikasi ini berfokus penuh pada estetika visual yang memukau, transisi yang halus, dan animasi imersif menggunakan **Flutter**. 

Dengan mengimplementasikan tema **GlassLike (Glassmorphism)** dikombinasikan dengan elemen fantasi modern (cyber-magic/neon-mystic), aplikasi ini bertujuan mengubah proses memesan minuman menjadi sebuah pengalaman interaktif yang magis bagi pelanggan. Data resep dan menu minuman secara dinamis ditarik menggunakan integrasi publik API dari **TheCocktailDB**.

---

## 2. Technical Stack & Coding Standard

### 2.1 Core Stack
* **Framework:** Flutter (Latest Stable)
* **State Management & DI:** Riverpod (`hooks_riverpod`) & Flutter Hooks (`flutter_hooks`)
* **Code Generation:** Freezed (`freezed`, `freezed_annotation`), JSON Serializable (`json_serializable`)
* **Local Storage:** Drift (`drift`) + Sqflite (`sqflite`)
* **Network Client:** Dio (`dio`)

### 2.2 Rules & Specifications
* **Feature-First Clean Architecture:** Aplikasi dibagi per fitur. Setiap fitur mengisolasi layer `data`, `domain`, dan `presentation` secara mandiri.
* **Strict Dependency Rule:** Repository dan Data Source **tidak boleh** menyentuh Presentation Layer tanpa melalui **UseCase**.
* **Single-File Feature DI:** Seluruh registrasi dependency injection (Data Source, Repository, UseCase, Notifier) wajib dikumpulkan di **satu berkas provider khusus pada root folder masing-masing fitur**.
* **Named Parameters:** Setiap fungsi, constructor, atau method yang menerima parameter **lebih dari 1 atribut wajib** menggunakan *named parameters*.
* **Code Generation Folder Isolation:** Seluruh file berkeluarga (*code generated family* seperti `.freezed.dart`, `.g.dart`) wajib diratakan di dalam folder entitasnya masing-masing di bawah kategori modelnya tanpa dicampur horizontal secara massal.

---

## 3. Directory Structure (Feature-First)
Berikut adalah visualisasi arsitektur direktori mutakhir untuk modul fitur `menu_catalog`:

```text
lib/
├── core/
│   ├── components/            # Global Atomic Components
│   │   ├── atoms/             # GlassContainer, NeonText, GlowingOrb
│   │   └── molecules/         # GlassSearchBar, CustomBottomBar
│   ├── network/               # Base Network Client (Dio) & Global Providers
│   └── theme/                 # GlassLike & Futuristic Fantasy Theme Definition
└── features/
    └── menu_catalog/
        ├── menu_catalog_provider.dart # SATU BERKAS UNTUK SEMUA DI / PROVIDER FITUR
        ├── data/
        │   ├── datasources/
        │   │   ├── local/
        │   │   │   └── drift/
        │   │   │       ├── daos/
        │   │   │       │   └── alcohol_dao.dart
        │   │   │       └── tables/
        │   │   │           └── alcohol/      # Folder rumpun tabel lokal
        │   │   │               ├── alcohol_table.dart
        │   │   │               └── alcohol_table.g.dart
        │   │   └── remote/
        │   │       └── cocktail_remote_data_source.dart
        │   └── models/
        │       ├── request/
        │       │   └── search/
        │       │       ├── search_cocktail_request.dart
        │       │       ├── search_cocktail_request.freezed.dart
        │       │       └── search_cocktail_request.g.dart
        │       └── response/
        │           └── alcohol/              # Folder rumpun model API
        │               ├── alcohol_response.dart
        │               ├── alcohol_response.freezed.dart
        │               └── alcohol_response.g.dart
        └── domain/
            ├── models/
            │   └── entities/
            │       └── alcohol/              # Folder rumpun pure domain model
            │           ├── alcohol_entity.dart
            │           └── alcohol_entity.freezed.dart
            └── usecases/
                └── get_cocktails_by_category_usecase.dart
```
