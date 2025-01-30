//
//  editToDoListViewController.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

class editToDoListViewController: UIViewController {
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editar", for: .normal)
        return button
    }()
    
    private lazy var editTextToDo: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    
}
