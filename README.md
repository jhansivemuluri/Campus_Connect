# Campus Connect — Mini Project (Experiments 1–4)

A single small Flutter app that covers Experiments 1 to 4 of the
"User Interface Design using Flutter" lab.

## How the experiments map to the code

| Experiment | What it asks | Where it is |
|---|---|---|
| 1(a) | Install Flutter & Dart SDK | Not code — see setup steps below |
| 1(b) | Simple Dart program, language basics | `lib/dart_basics.dart` |
| 2(a)/(b) | Explore Text/Image/Container; Row/Column/Stack layouts | `lib/screens/widgets_screen.dart` |
| 3(a)/(b) | Responsive UI with breakpoints | `lib/screens/responsive_screen.dart` |
| 4(a)/(b) | Navigator + named routes | `lib/main.dart`, `lib/screens/home_screen.dart`, `lib/screens/profile_screen.dart` |

## 1. Install Flutter & Dart SDK
1. Download the Flutter SDK from flutter.dev and unzip it.
2. Add `flutter/bin` to your PATH.
3. Run `flutter doctor` and fix anything it flags (Android Studio, emulator, etc.).
4. Confirm with `flutter --version`.

## 2. Run the Dart-basics script (Experiment 1b)
```
dart run lib/dart_basics.dart
```
This prints variables, a function with a default parameter, a for-loop with
if/else grading logic, a Map iteration, and a simple class — all core Dart
syntax in one file.

## 3. Run the Flutter app (Experiments 2–4)
```
flutter pub get
flutter run
```
This launches **Home Screen**, from which you can navigate to:
- **Widgets & Layouts Demo** — Text, Image, Container, Row, Column, Stack
- **Responsive UI Demo** — resize the window (or run on web with
  `flutter run -d chrome`) to watch the grid go from 1 → 2 → 3 columns
- **Profile** — reached via `Navigator.pushNamed` with arguments, showing
  navigation between screens using named routes

## Project structure
```
campus_connect/
├── pubspec.yaml
├── README.md
└── lib/
    ├── dart_basics.dart          # Experiment 1(b)
    ├── main.dart                 # App entry + named routes (Exp 4)
    └── screens/
        ├── home_screen.dart      # Exp 4(a): Navigator basics
        ├── widgets_screen.dart   # Exp 2: widgets & layouts
        ├── responsive_screen.dart# Exp 3: responsive UI
        └── profile_screen.dart   # Exp 4(b): named route + arguments
```
