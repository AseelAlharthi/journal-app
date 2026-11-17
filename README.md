# 📓 Journali

**Your thoughts, your story.**

Journali is a simple journaling app built with **Swift** and **SwiftUI**. You can write daily journals, bookmark your favorites, search through them, and delete the ones you don't need. Everything is saved on your device.

---

## ✨ Features

- 📝 **Write & Edit**: create a new journal or edit an existing one
- 🔖 **Bookmark**: mark your favorite journals
- 🔍 **Search**: find journals by title or content
- 🔽 **Filter**: show bookmarked journals only, or all journals sorted by date
- 🗑️ **Swipe to Delete**: with a confirmation alert before deleting
- ⚠️ **Discard Changes**: confirmation before closing the editor without saving
- 📭 **Empty State**: a friendly screen when there are no journals yet
- ✅ **Save Validation**: a journal can't be saved with an empty title
- 💾 **Auto Save**: journals are saved automatically on the device
- 🌙 **Dark Mode**: the app is designed with a dark look
- 🫧 **Liquid Glass**: the new Apple design for the toolbar, search bar, sheets, and alerts

---

## 🏗️ Architecture: MVVM

The project follows the **MVVM** design pattern to keep the code clean and organized.

| Layer | Role | Files |
|---|---|---|
| **Model** | The data and how it is saved | `JournalEntry`, `SortOption`, `JournalStorage` |
| **ViewModel** | The logic: add, edit, delete, search, filter | `JournalListViewModel`, `JournalEditorViewModel` |
| **View** | The UI: what the user sees | `SplashView`, `JournalListView`, `JournalCardView`, `JournalEditorView`, `EmptyStateView` |

```
journali app
├── App
│   └── MyApp.swift
├── Logic
│   ├── Model
│   │   ├── JournalEntry.swift
│   │   ├── JournalStorage.swift
│   │   └── SortOption.swift
│   └── ViewModel
│       ├── JournalEditorViewModel.swift
│       └── JournalListViewModel.swift
├── Resources
│   └── Assets
└── View
    ├── EmptyStateView.swift
    ├── JournalCardView.swift
    ├── JournalEditorView.swift
    ├── JournalListView.swift
    └── SplashView.swift
```

---

## 📚 What I Learned

- **SwiftUI Layout**: `VStack`, `HStack`, `ZStack`, `List`
- **Navigation & Toolbar**: `NavigationStack`, `.sheet`, `.toolbar`, `Menu`
- **State Management**: `@State`, `@StateObject`, `@ObservedObject`, `@Published`
- **Data Modeling**:
  - `struct` for the journal data (`JournalEntry`)
  - `class` for the ViewModels (shared and observable)
  - `enum` for the filter options (`SortOption`)
- **Optionals**: safe unwrapping with `if let` and `try?` (no force unwrap `!`)
- **Saving Data**: `Codable` + `JSONEncoder` / `JSONDecoder` + `UserDefaults`
- **User Experience**: empty state, alerts, confirmation dialogs
- **Liquid Glass**: built-in glass on system components like the toolbar, search bar, and sheets
- **GitHub**: commits and pushing changes
- **Running on a real iPhone**: signing, deployment target, and trusting the developer

---

## 🛠️ Requirements

- Xcode 27
- iOS 27.0.1 or later

## ▶️ How to Run

1. Clone the repository
2. Open `journali app.xcodeproj` in Xcode
3. Choose an iPhone simulator or your iPhone
4. Press **Run** ▶️

