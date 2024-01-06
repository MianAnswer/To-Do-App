//
//  ContentView.swift
//  DoIt
//
//  Created by Mian Answer on 12/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(toDoItems: ToDoItem.examples)
    @State private var presentSheet: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.toDoItems) { item in
                    ToDoItemView(toDoItem: item)
                }
                .onDelete(perform: { indexSet in
                    viewModel.removeToDoItem(at: indexSet)
                })
            }
            .toolbar(content: {
                Button {
                    presentSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            })
            .listStyle(.inset)
            .padding()
            .sheet(isPresented: $presentSheet, content: {
                CreateToDoItemView { todoitem in
                    viewModel.addToDoItem(toDoItem: todoitem)
                }
            })
        }
        
    }
}

#Preview {
    ContentView()
}
