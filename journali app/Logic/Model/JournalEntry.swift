//
//  JournalEntry.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import Foundation

// شكل اليومية
struct JournalEntry: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool = false
}

// يوميات تجريبية (بنمسحها بعدين)
let sampleEntries: [JournalEntry] = [
    JournalEntry(title: "My Birthday", content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", date: Date(), isBookmarked: true),
    JournalEntry(title: "Today's Journal", content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", date: Date()),
    JournalEntry(title: "Great Day", content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", date: Date())
]
