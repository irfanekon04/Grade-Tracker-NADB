# Student Grade Tracker

A production-quality Flutter application for tracking student grades across subjects. Built with clean architecture, Provider state management, and Material 3 design.

## Features

- **Add Subjects** – Form-based input with validation for subject name and marks
- **Subject List** – Scrollable list with swipe-to-delete via Dismissible widgets
- **Performance Summary** – Automatic statistics: total subjects, average marks, overall grade, passing/failing counts
- **Dark Mode** – Custom light and dark themes toggleable from the AppBar
- **Material 3** – Modern UI with rounded cards, consistent spacing, and responsive layout

## Folder Structure

```
lib/
├── main.dart                     # Entry point with MultiProvider
├── models/
│   └── subject.dart              # Subject model with grade computation
├── providers/
│   ├── subject_provider.dart     # Subject CRUD and statistics
│   ├── theme_provider.dart       # Theme toggle state
│   └── navigation_provider.dart  # Bottom navigation index
├── screens/
│   ├── home_screen.dart          # Shell with NavigationBar
│   ├── add_subject_screen.dart   # Form to add a subject
│   ├── subject_list_screen.dart  # Dismissible subject list
│   └── summary_screen.dart       # Performance overview
├── widgets/
│   ├── subject_card.dart         # Subject display card
│   ├── summary_card.dart         # Summary stat card
│   └── custom_text_field.dart    # Reusable form field
├── theme/
│   └── app_theme.dart            # Custom light/dark ThemeData
└── utils/                        # Utility functions (extend as needed)
```

## Packages Used

| Package    | Purpose                      |
|------------|------------------------------|
| flutter    | UI framework                 |
| provider   | State management             |

## How to Run

```bash
# Install dependencies
flutter pub get

# Run the application
flutter run
```

## Screenshots

*(Screenshots section – add images here)*

## Assignment Requirements Covered

- [x] Three main pages with BottomNavigationBar
- [x] Provider for state management (no setState)
- [x] Subject model with private `_mark`, public getters, grade calculation
- [x] SubjectProvider with `addSubject`, `removeSubject`, `averageMark`, `overallGrade`, `totalSubjects`, `passingSubjects`, `failingSubjects`
- [x] `.map()` and `.where()` usage in provider
- [x] Form validation (empty name, numeric marks, range 0–100)
- [x] SnackBar on successful subject addition
- [x] ListView.builder with Dismissible swipe-to-delete
- [x] Empty state when no subjects exist
- [x] Automatic summary updates via Provider
- [x] Custom light and dark themes (no `ThemeData.light()` / `ThemeData.dark()`)
- [x] Theme toggle in AppBar
- [x] All colors from `Theme.of(context)`
- [x] Material 3 with `useMaterial3: true`
- [x] `const` constructors, meaningful names, small reusable widgets
- [x] Clean architecture (UI separated from business logic)
