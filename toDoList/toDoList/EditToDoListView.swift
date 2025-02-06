//
//  EditToDoListView.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 05/02/25.
//

import SwiftUI

struct EditToDoListView: View {
    var body: some View {
        ZStack {
            // Fundo Branco
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    // Botão de voltar (Esquerda)
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .frame(width: 50, height: 60)
                        .padding()
                    
                    Spacer()
                    
                    // Botão de Editar (Direita)
                    Text("Editar")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    EditToDoListView()
}
