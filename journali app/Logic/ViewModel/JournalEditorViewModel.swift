//
//  JournalEditorViewModel.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import Foundation
import Combine

class JournalEditorViewModel: ObservableObject {

    @Published var title = ""
    @Published var content = ""
    @Published var date = Date()

    // ✕ تنبيه "Discard Changes"
    @Published var showDiscardAlert = false

    // نحفظ الكلام الأصلي عشان نعرف إذا تغير شيء
    private var originalTitle = ""
    private var originalContent = ""

    // 📥 نعبّي الخانات (إذا تعديل)
    func load(entry: JournalEntry?) {
        if let entry = entry {
            title = entry.title
            content = entry.content
            date = entry.date
        }

        originalTitle = title
        originalContent = content
    }

    // ❓ هل المستخدم غيّر شيء؟
    var hasChanges: Bool {
        if title != originalTitle || content != originalContent {
            return true
        }
        return false
    }

    // ✓ هل نقدر نحفظ؟
    var canSave: Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        return true
    }
}
