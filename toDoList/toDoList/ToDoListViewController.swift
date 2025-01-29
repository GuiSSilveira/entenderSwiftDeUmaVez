//
//  ToDoListViewController.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

class ToDoListViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        return button
    }()
    
    private lazy var checkBox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkBoxIcon"), for: .normal)
        return button
    }()
    
    private lazy var textToDo: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var check: UIImage = {
        let image = UIImage(named: "checkBoxIcon")!
        return image
    }()
    
    
}
