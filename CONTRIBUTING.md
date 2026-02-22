# Contributing to Leafy

Thank you for considering contributing to Leafy! Your involvement helps make this app better for everyone. Please take a moment to review this document to understand how you can contribute.

## Table of Contents

- [Contributing to Leafy](#contributing-to-leafy)
  - [Table of Contents](#table-of-contents)
  - [About Leafy](#about-leafy)
  - [Types of Contributions](#types-of-contributions)
  - [Code Contribution](#code-contribution)
    - [Main Guidelines](#main-guidelines)
    - [Project Setup](#project-setup)
      - [Prerequisites](#prerequisites)
      - [Steps](#steps)
    - [Code Formatting](#code-formatting)
    - [Architecture Overview](#architecture-overview)
  - [Translations](#translations)
  - [Bug Report](#bug-report)
  - [Feature Request](#feature-request)
  - [Decision Making](#decision-making)

## About Leafy

Leafy is a free, open-source, privacy-focused book tracker and reader app built with Flutter. It allows users to organize their reading library, read EPUB & PDF files directly in-app, view reading statistics, and back up their data — all without ads or user tracking.

## Types of Contributions

We welcome various contributions, including:

- 🐛 Bug fixes
- ✨ New features
- 🌍 Translations
- 📝 Documentation improvements
- 🧪 Testing
- 🎨 UI/UX improvements

## Code Contribution

### Main Guidelines

1. **Fork & Branch** — Create a fork and a dedicated branch for your contribution.
2. **Conventional Commits** — Follow the [Conventional Commits](https://www.conventionalcommits.org/) convention. Examples:
   - `feat: add new feature`
   - `fix: resolve a bug`
   - `refactor: restructure book repository`
   - `docs: update README`
   - `chore: update dependencies`
3. **Atomic Commits** — Keep commits small and focused with clear messages.
4. **Pull Request** — Submit a pull request of the "rebase and merge" type.
5. **Pipeline** — Ensure the pull request's CI pipeline is passing.

### Project Setup

#### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (≥ 3.10.0)
- Android SDK / Xcode (for mobile builds)

#### Steps

```shell
# 1. Clone your fork
git clone https://github.com/<your-username>/leafy.git
cd leafy

# 2. Install dependencies
flutter pub get

# 3. Generate code (freezed, json_serializable, injectable, retrofit, etc.)
dart run build_runner build --delete-conflicting-outputs

# 4. Generate localization keys
melos run elgen

# 5. Run the app
flutter run
```

### Code Formatting

Ensure that your code follows the Dart formatting conventions:

```shell
dart format lib
```

You can also analyze the code for potential issues:

```shell
dart analyze lib
```

### Architecture Overview

Leafy follows **Clean Architecture** with a clear separation of concerns:

```text
lib/
├── core/          # Constants, configs, utilities, services
├── data/          # Data sources, repositories implementations, models
├── di/            # Dependency injection (Injectable + GetIt)
├── domain/        # Entities, repository interfaces, use cases
├── generated/     # Auto-generated code (localization keys, etc.)
├── logic/         # State management (BLoC + Cubit)
├── router/        # Navigation (GoRouter)
├── ui/            # Screens, widgets, UI components
└── main.dart      # App entry point
```

**Key technologies:**

- **State Management:** flutter_bloc + hydrated_bloc
- **DI:** injectable + get_it
- **Database:** sqflite (SQLite)
- **Networking:** dio + retrofit
- **Navigation:** go_router
- **Localization:** easy_localization

## Translations

Translations are managed via JSON files in the `assets/translations/` directory.

**Currently supported languages:**

- 🇺🇸 English (`en-US.json`)
- 🇻🇳 Tiếng Việt (`vi-VN.json`)

**To add a new language:**

1. Create a new JSON file in `assets/translations/` (e.g., `ja-JP.json`)
2. Copy the structure from `en-US.json` and translate all values
3. Register the new locale in `main.dart`
4. Submit a pull request

**To improve existing translations:**

Simply edit the corresponding JSON file and submit a pull request.

## Bug Report

When reporting a bug, please include:

- Device model and OS version
- App version
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable

Submit an issue here: [Leafy Issues](https://github.com/nmheeir/leafy/issues)

## Feature Request

Have an idea to improve Leafy? We'd love to hear it!

Submit a feature request here: [Leafy Issues](https://github.com/nmheeir/leafy/issues)

Please describe:

- The problem you're trying to solve
- Your proposed solution
- Any alternatives you've considered

## Decision Making

Decisions are typically made by the project owner. For significant changes, please open an issue first to discuss the approach before investing time in implementation.

---

Thank you for your contributions to Leafy! 🍃
