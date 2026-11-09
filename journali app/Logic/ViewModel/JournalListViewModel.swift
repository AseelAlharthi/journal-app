//
//  JournalListViewModel.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import Foundation
import Combine

class JournalListViewModel: ObservableObject {

    @Published var searchText = ""
    @Published var entries: [JournalEntry] = []

    // 🔽 الفلتر
    @Published var sortOption: SortOption = .date

    // ✍️ صفحة الكتابة
    @Published var showEditor = false
    @Published var entryToEdit: JournalEntry? = nil

    // 🗑️ للحذف
    @Published var showDeleteAlert = false
    @Published var entryToDelete: JournalEntry? = nil

    // 🔍 + 🔽 اليوميات اللي نعرضها
    var filteredEntries: [JournalEntry] {
        var result: [JournalEntry] = []
        let word = searchText.lowercased()

        for item in entries {

            var matchSearch = false
            if searchText.isEmpty {
                matchSearch = true
            } else if item.title.lowercased().contains(word) || item.content.lowercased().contains(word) {
                matchSearch = true
            }

            var matchFilter = true
            if sortOption == .bookmark && item.isBookmarked == false {
                matchFilter = false
            }

            if matchSearch && matchFilter {
                result.append(item)
            }
        }

        return result.sorted(by: { a, b in a.date > b.date })
    }

    // ➕ نفتح صفحة الكتابة ليومية جديدة
    func openNewEntry() {
        entryToEdit = nil
        showEditor = true
    }

    // ✏️ نفتح صفحة الكتابة لتعديل يومية
    func openEdit(entry: JournalEntry) {
        entryToEdit = entry
        showEditor = true
    }

    // ✓ الحفظ
    func save(title: String, content: String) {
        if let editing = entryToEdit {
            for i in entries.indices {
                if entries[i].id == editing.id {
                    entries[i].title = title
                    entries[i].content = content
                }
            }
        } else {
            let newEntry = JournalEntry(title: title, content: content, date: Date())
            entries.append(newEntry)
        }

        showEditor = false
    }

    // ✕ نسكّر بدون حفظ
    func closeEditor() {
        showEditor = false
    }

    // 🔖 البوكمارك
    func toggleBookmark(entry: JournalEntry) {
        for i in entries.indices {
            if entries[i].id == entry.id {
                entries[i].isBookmarked.toggle()
            }
        }
    }

    // 🗑️ نحفظ اليومية ونعرض التنبيه
    func askToDelete(entry: JournalEntry) {
        entryToDelete = entry
        showDeleteAlert = true
    }

    // 🗑️ الحذف
    func confirmDelete() {
        if let entry = entryToDelete {
            var newList: [JournalEntry] = []

            for item in entries {
                if item.id != entry.id {
                    newList.append(item)
                }
            }

            entries = newList
        }
        entryToDelete = nil
    }
}
