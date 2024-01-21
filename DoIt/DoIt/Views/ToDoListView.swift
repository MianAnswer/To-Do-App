//
//  ToDoListView.swift
//  DoIt
//
//  Created by Mian Answer on 1/20/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var presentCreateSheet: Bool = false
    @State private var editableToDoItem: ToDoItem? = nil
    
    var title: String
    var toDoItems: [ToDoItem]
    var removeToDoItem:  (ToDoItem) -> Void
    var addToDoItem: (ToDoItem) -> Void
    var saveToDoItem: (ToDoItem) -> Void

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDoItems) { item in
                    ToDoItemView(toDoItem: item)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                removeToDoItem(item)
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
                    addToDoItem(todoitem)
                }
            }
            .sheet(item: $editableToDoItem) { item in
                EditToDoItemView(toDoItem: item) { todoitem in
                    saveToDoItem(todoitem)
                }
            }
            .navigationTitle(title)
        }
    }
}

#Preview {
    ToDoListView(title: "List", toDoItems: ToDoItem.examples, removeToDoItem: { item in }, addToDoItem: { item in }, saveToDoItem: { item in })
}
