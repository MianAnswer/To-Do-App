//
//  ContentView.swift
//  DoIt
//
//  Created by Mian Answer on 12/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(toDoItems: ToDoItem.examples)
    var body: some View {
        List {
            ForEach(viewModel.toDoItems) { item in
                ToDoItemView(toDoItem: item)
            }
            .onDelete(perform: { indexSet in
                viewModel.removeToDoItem(at: indexSet)
            })
        }
        .listStyle(.inset)
        .padding()
    }
}

#Preview {
    ContentView()
}
