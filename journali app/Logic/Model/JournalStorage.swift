//
//  JournalStorage.swift
//  journali app
//
//  Created by Aseel2 on 04/06/1448 AH.
//

import Foundation

// 🔑 اسم الدرج (مكتوب مرة وحدة بس)
let storageKey = "journalEntries"

// 💾 نحفظ اليوميات في الدرج
func saveEntries(entries: [JournalEntry]) {
    if let data = try? JSONEncoder().encode(entries) {
        UserDefaults.standard.set(data, forKey: storageKey)
    }
}

// 📂 نطلع اليوميات من الدرج
func loadEntries() -> [JournalEntry] {
    if let data = UserDefaults.standard.data(forKey: storageKey) {
        if let entries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            return entries
        }
    }
    return []
}
