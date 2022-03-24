//
//  ViewController.swift
//  Drawing3
//
//  Created by BSP Macbook on 3/21/22.
//

import UIKit


class ViewController: UIViewController {
    
    // Declare variable relative
    // Declare draw
    let canvas = Canvas()
    // End draw
    // End declaring
    
    // Add undo, clear button and choosing color
    // Undo button
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    // End undo
    
    // func undo
    @objc func handleUndo() {
        canvas.undo()
    }
    // End func
    
    // Clear button
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    // End clear
    
    // func clear
    @objc func handleClear() {
        print("Clear func")
        canvas.clear()
    }
    // End func
    // End Adding
    
    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        canvas.backgroundColor = .white
        
        setLayouts()
        // End Constrainting
    }
    
    // Set layout to showing
    fileprivate func setLayouts() {
        // Show undo, clear button
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
        ])
        // End showing
        
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        // Constraint position of stackview to showing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    // End setting
}

