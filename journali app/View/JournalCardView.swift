//
//  JournalCardView.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import SwiftUI

struct JournalCardView: View {

    var entry: JournalEntry
    @ObservedObject var viewModel: JournalListViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(entry.title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("LightPurple"))

                Spacer()

                Button {
                    viewModel.toggleBookmark(entry: entry)
                } label: {
                    if entry.isBookmarked {
                        Image(systemName: "bookmark.fill")
                    } else {
                        Image(systemName: "bookmark")
                    }
                }
                .foregroundStyle(Color("LightPurple"))
                .buttonStyle(.plain)
            }

            Text(entry.date.formatted(date: .numeric, time: .omitted))
                .font(.caption)
                .foregroundStyle(Color("DateGray"))

            Text(entry.content)
                .foregroundStyle(.primary)
                .lineLimit(5)
        }
        .padding()
        .background(Color("CardGray"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview("Light") {
    JournalCardView(entry: sampleEntries[0], viewModel: JournalListViewModel())
        .padding()
}

#Preview("Dark") {
    JournalCardView(entry: sampleEntries[1], viewModel: JournalListViewModel())
        .padding()
        .preferredColorScheme(.dark)
}
