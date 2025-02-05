//
//  ToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoListViewModel() // Criando a ViewModel

    var body: some View {
        ZStack {
            // Fundo Branco
            Color.white.ignoresSafeArea()
            
            VStack {
                // Botão de adicionar
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
                
                // Adicionando ScrollView para permitir rolagem
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.tasks) { task in
                            HStack {
                                // Botão de check
                                Button(action: {
                                    viewModel.toggleTask(task)
                                }) {
                                    Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(task.isCompleted ? .green : .orange)
                                }
                                
                                // Texto da tarefa com riscado ao completar
                                Text(task.text)
                                    .font(.headline)
                                    .foregroundColor(task.isCompleted ? .gray : .black)
                                    .strikethrough(task.isCompleted, color: .gray)
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ToDoListView()
}
