//
//  EditToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 05/02/25.
//

import SwiftUI

struct EditToDoListView: View {
    var task: TaskModel  // Agora a task é passada diretamente

    @State private var isEditing = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack {
                        NavigationLink(destination: ToDoListView(coordinator: ToDoCoordinator())) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.red)
                                .frame(width: 50, height: 60)
                                .padding()
                        }
                        Spacer()
                        
                        Button("Editar") {
                            isEditing.toggle()
                            isFocused = true
                        }
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding()
                    }
                    
                    if isEditing {
                        TextField("Editar tarefa", text: .constant(task.text)) // Não precisamos de binding, já passamos a task
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($isFocused)
                            .onSubmit {
                                isEditing = false
                                isFocused = false
                            }
                    } else {
                        Text(task.text)
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
