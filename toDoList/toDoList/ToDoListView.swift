//
//  ToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

struct ToDoListView: View {
    @State private var tasks: [String] = ["Task 1", "Task 2"]
    @State private var newTask: String = ""
    
    var body: some View {
        ZStack {
            // Fundo Branco
            Color.white.ignoresSafeArea()
            
            VStack {
                // Botão de adicionar
                HStack {
                    Spacer()
                    Button(action: {
                        addTask()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                    .padding()
                }
                
                // Lista de To-Dos
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            Button(action: {
                                toggleTask(index)
                            }) {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.orange)
                            }
                            
                            Text(tasks[index])
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
    
    // Função para adicionar uma nova tarefa (simples para teste)
    private func addTask() {
        tasks.append("New Task")
    }
    
    // Função para marcar/desmarcar a tarefa
    private func toggleTask(_ index: Int) {
        // Implementação futura para riscar o texto ao completar a tarefa
    }
}

#Preview {
    ToDoListView()
}
