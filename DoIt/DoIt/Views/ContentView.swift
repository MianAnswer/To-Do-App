//
//  ContentView.swift
//  DoIt
//
//  Created by Mian Answer on 12/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(toDoItems: ToDoItem.examples)
    @State private var presentCreateSheet: Bool = false
    @State private var editableToDoItem: ToDoItem? = nil
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.toDoItems) { item in
                    ToDoItemView(toDoItem: item)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                viewModel.removeToDoItem(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                editableToDoItem = item
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                }
            }
            .toolbar(content: {
                Button {
                    presentCreateSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            })
            .listStyle(.inset)
            .padding()
            .sheet(isPresented: $presentCreateSheet) {
                CreateToDoItemView { todoitem in
                    viewModel.addToDoItem(todoitem)
                }
            }
            .sheet(item: $editableToDoItem) { item in
                EditToDoItemView(toDoItem: item) { todoitem in
                    viewModel.saveToDoItem(todoitem)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
