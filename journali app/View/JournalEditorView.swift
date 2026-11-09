//
//  JournalEditorView.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import SwiftUI

struct JournalEditorView: View {

    @StateObject var viewModel = JournalEditorViewModel()
    @ObservedObject var listViewModel: JournalListViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {

                // العنوان
                TextField("Title", text: $viewModel.title)
                    .font(.largeTitle)
                    .bold()

                // التاريخ
                Text(viewModel.date.formatted(date: .numeric, time: .omitted))
                    .foregroundStyle(Color("DateGray"))

                // المحتوى
                ZStack(alignment: .topLeading) {
                    if viewModel.content.isEmpty {
                        Text("Type your Journal...")
                            .foregroundStyle(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }

                    TextEditor(text: $viewModel.content)
                        .scrollContentBackground(.hidden)
                }
            }
            .padding()
            .toolbar {
                // ✕ الإلغاء
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if viewModel.hasChanges {
                            viewModel.showDiscardAlert = true
                        } else {
                            listViewModel.closeEditor()
                        }
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .confirmationDialog(
                        "Are you sure you want to discard changes on this journal?",
                        isPresented: $viewModel.showDiscardAlert,
                        titleVisibility: .visible
                    ) {
                        Button("Discard Changes", role: .destructive) {
                            listViewModel.closeEditor()
                        }
                        Button("Keep Editing", role: .cancel) { }
                    }
                }

                // ✓ الحفظ
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        listViewModel.save(title: viewModel.title, content: viewModel.content)
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("MainPurple"))
                    .disabled(viewModel.title.isEmpty)
                }
            }
        }
        .onAppear {
            viewModel.load(entry: listViewModel.entryToEdit)
        }
        .interactiveDismissDisabled(viewModel.hasChanges)
    }
}

#Preview("Light") {
    JournalEditorView(listViewModel: JournalListViewModel())
}

#Preview("Dark") {
    JournalEditorView(listViewModel: JournalListViewModel())
        .preferredColorScheme(.dark)
}
