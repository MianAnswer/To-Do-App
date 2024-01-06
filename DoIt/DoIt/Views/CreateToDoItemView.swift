//
//  CreateToDoItemView.swift
//  DoIt
//
//  Created by Mian Answer on 1/5/24.
//

import SwiftUI

struct CreateToDoItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var task: String = ""
    @State private var dueDate: Date = Date.now
    var addToDoItem: (ToDoItem) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Task", text: $task)
                }
                
                Section {
                    DatePicker(
                        "Due Date",
                        selection: $dueDate,
                        in: Date.now...Date.distantFuture,
                        displayedComponents: [.date]
                    )
                        .datePickerStyle(.compact)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let todoitem = ToDoItem(task: task, dueDate: dueDate)
                        addToDoItem(todoitem)
                        dismiss()
                    } label: {
                        Text("Add")
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
    CreateToDoItemView() { todoitem in
        
    }
}
