//
//  ToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel: ToDoListViewModel
    
    init(coordinator: ToDoCoordinator) {
        _viewModel = StateObject(wrappedValue: ToDoListViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: viewModel.addTask) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                        }
                        .padding()
                    }
                    
                    if !viewModel.tasks.isEmpty {
                        ScrollView {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.tasks) { task in
                                    HStack {
                                        Button(action: {
                                            viewModel.toggleTask(task) // Alterna o estado da tarefa
                                        }) {
                                            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(task.isCompleted ? .green : .orange)
                                        }
                                        
                                        NavigationLink(destination: EditToDoListView(task: task)) {
                                            Text(task.text)
                                                .font(.headline)
                                                .foregroundColor(task.isCompleted ? .gray : .black)
                                                .strikethrough(task.isCompleted, color: .gray)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .navigationBarBackButtonHidden(true)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
