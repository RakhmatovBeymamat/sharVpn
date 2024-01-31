//
//  MainViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var mainViewControllerCoordinator: MainViewControllerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "ШАР"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 69),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 171)
        ])
        
        label.font = .Neuropol.neuropol.size(of: 64)
        label.textColor = AppColors.endGradientColor
        
        view.backgroundColor = AppColors.inputBgColor
        
        // Создание кнопки
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("Нажми меня", for: .normal)
        
        // Привязка действия к кнопке
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // Добавление кнопки на экран
        view.addSubview(button)
    }
            
    @objc func buttonAction() {
        // Действие, которое будет выполняться при нажатии на кнопку
        mainViewControllerCoordinator?.runAboutViewController()
    }
}
