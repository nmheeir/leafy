# Plan: Welcome Screen Implementation
>
> **User Request:** Add logic to display the Welcome Screen on first app launch and accessible via Settings.
> **Task Slug:** `welcome-screen-logic`

## 1. Analysis & Architecture

### Goal

Implement a "First Time User Experience" (FTUE) flow where:

1. The `WelcomeScreen` appears automatically when the app is launched for the first time.
2. The user can manually revisit the `WelcomeScreen` from the `SettingsScreen`.
3. Completing the `WelcomeScreen` (or skipping) marks the FTUE as done.

### Architecture Decisions

- **State Persistence:** Use `SharedPreferences` to store a boolean flag `is_first_launch` (default: `true`).
- **Service Layer:** Create a dedicated `IntroService` (or `FirstLaunchService`) to encapsulate the logic for checking and setting this flag. This keeps the persistence logic decoupled from UI and Router.
- **Dependency Injection:** Register `SharedPreferences` and `IntroService` using `injectable` (GetIt).
- **Routing:** Modify the existing `GoRouter` configuration in `lib/router/router.dart` to utilize `redirect` logic based on the `IntroService` state.

## 2. Implementation Steps

### Phase 1: Infrastructure & Service

1. **Update `StorageModule` (`lib/di/module/storage_module.dart`)**:
    - Register `SharedPreferences` as a singleton. Use `@preResolve` since `SharedPreferences.getInstance()` is async.
2. **Create `IntroService` (`lib/core/services/intro_service.dart`)**:
    - Depend on `SharedPreferences`.
    - Method `bool get isFirstTime`: returns value from prefs (default true).
    - Method `Future<void> completeIntro()`: sets flag to false.

### Phase 2: Routing Logic

3. **Update `Router` (`lib/router/router.dart`)**:
    - Retrieve `IntroService` via `getIt`.
    - Implement `redirect` callback in `GoRouter`.
    - Logic: If `state.fullPath` is `Routes.welcome`, allow it. If `IntroService.isFirstTime` is true, redirect to `Routes.welcome`.
    - *Edge Case*: Ensure we don't redirect to welcome if we are *already* on welcome (infinite loop prevention).

### Phase 3: UI Updates

4. **Update `WelcomeScreen` (`lib/ui/welcome/welcome_screen.dart`)**:
    - Locate `_moveToHomeScreen` method.
    - Call `IntroService.completeIntro()` before navigating.
    - Ensure navigation uses `context.go(Routes.home)` (replacing curr stack) to prevent "back" going to welcome.
2. **Update `SettingsScreen` (`lib/ui/settings/settings_screen.dart`)**:
    - Add a new `SettingsTile` in the **App** section (or similar).
    - Title: "Show Welcome Screen" (localized).
    - Action: `context.push(Routes.welcome)`.

## 3. Verification Plan

### Automated Checks

- [ ] **Linting**: Ensure no lint errors in new service.
- [ ] **Generation**: Run `build_runner` to generate DI code (`flutter pub run build_runner build --delete-conflicting-outputs`).

### Manual Verification

1. **Fresh Install Test**:
    - Uninstall app.
    - Install/Debug app.
    - Observe `WelcomeScreen` shows up first.
    - Complete welcome flow.
    - Verify redirection to `HomeScreen`.
    - Restart app. Verify `HomeScreen` shows up (NOT `WelcomeScreen`).
2. **Settings Test**:
    - Go to Settings.
    - Find "Show Welcome Screen".
    - Tap it. Verify navigation to `WelcomeScreen`.
    - Complete it. Verify return to previous screen or Home (depending on interaction, `push` vs `go`).

## 4. Dependencies

- `shared_preferences` (already in pubspec).
- `injectable` / `get_it` (already in project).
- `go_router` (already in project).

## 5. Potential Risks

- **Async Config**: `SharedPreferences` requires async init. `StorageModule` using `@preResolve` handles this, as `configureDependencies` in `main.dart` is awaited.
- **Router Loop**: Careful with `redirect` logic to avoid infinite redirects.
