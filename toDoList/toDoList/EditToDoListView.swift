//
//  EditToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 05/02/25.
//

import SwiftUI

struct EditToDoListView: View {
    @State private var editedText: String  // Armazena o texto editado
    @State private var isEditing: Bool = false  // Controla se está no modo de edição
    @FocusState private var isFocused: Bool  // Controla o foco no TextField
    
    var task: TaskModel  // Tarefa passada pela ToDoListView
    @ObservedObject var viewModel: ToDoListViewModel  // Referência à ViewModel

    // Inicializa a view com a task e o viewModel
    init(task: TaskModel, viewModel: ToDoListViewModel) {
        self.task = task  // A task é passada diretamente
        self.viewModel = viewModel  // O viewModel é passado diretamente
        _editedText = State(initialValue: task.text)  // Inicializa o texto com a tarefa
    }

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

                        Button(action: {
                            // Alterna entre editar e visualizar
                            isEditing.toggle()
                        }) {
                            Text(isEditing ? "Salvar" : "Editar")
                                .foregroundColor(.blue)
                                .font(.headline)
                                .padding()
                        }
                    }

                    if isEditing {
                        TextField("Editar tarefa", text: $editedText)  // Usa o State para editar o texto
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($isFocused)  // Foca no campo ao entrar no modo de edição
                            .onSubmit {
                                saveEditedTask()  // Salva quando pressionado "Enter"
                                isEditing = false
                                isFocused = false
                            }
                    } else {
                        // Exibe o texto da tarefa
                        Text(task.text)
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .strikethrough(task.isCompleted, color: .gray)
                    }

                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .onChange(of: isEditing) { newValue in
            if !newValue {
                saveEditedTask()  // Salva o texto editado quando o modo de edição é desativado
            }
        }
    }

    func saveEditedTask() {
        // Atualiza a tarefa na ViewModel com o texto editado
        viewModel.updateTaskText(taskId: task.id, newText: editedText)
        print("Texto alterado para: \(editedText)")  // Imprime o texto alterado para debug
    }
}
