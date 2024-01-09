//
//  EditToDoItemView.swift
//  DoIt
//
//  Created by Mian Answer on 1/8/24.
//

import SwiftUI

struct EditToDoItemView: View {
    @Environment(\.dismiss) var dismiss
    @State var toDoItem: ToDoItem
    var saveToDoItem: (ToDoItem) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Task", text: $toDoItem.task)
                }
                
                Section {
                    DatePicker(
                        "Due Date",
                        selection: $toDoItem.dueDate,
                        in: Date.now...Date.distantFuture,
                        displayedComponents: [.date]
                    )
                        .datePickerStyle(.compact)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        toDoItem.updatedAt = Date.now
                        saveToDoItem(toDoItem)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            })
        }
    }
}

#Preview {
    EditToDoItemView(toDoItem: ToDoItem.examples[0]) { _ in
        
    }
}
