//
//  JournalListView.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import SwiftUI

struct JournalListView: View {

    @StateObject var viewModel = JournalListViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()

                if viewModel.entries.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.filteredEntries) { entry in
                        JournalCardView(entry: entry, viewModel: viewModel)
                            .onTapGesture {
                                viewModel.openEdit(entry: entry)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .swipeActions {
                                Button {
                                    viewModel.askToDelete(entry: entry)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(Color("DeleteRed"))
                            }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Journal")
            .searchable(text: $viewModel.searchText)
            .alert("Delete Journal?", isPresented: $viewModel.showDeleteAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    viewModel.confirmDelete()
                }
            } message: {
                Text("Are you sure you want to delete this journal?")
            }
            .sheet(isPresented: $viewModel.showEditor) {
                JournalEditorView(listViewModel: viewModel)
            }
            .toolbar {
                ToolbarItemGroup {
                    Menu {
                        Button("Sort by Bookmark") {
                            viewModel.sortOption = .bookmark
                        }
                        Button("Sort by Entry Date") {
                            viewModel.sortOption = .date
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }

                    Button {
                        viewModel.openNewEntry()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview("Light") {
    JournalListView()
}

#Preview("Dark") {
    JournalListView()
        .preferredColorScheme(.dark)
}
