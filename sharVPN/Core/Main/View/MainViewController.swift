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

//        let label = UILabel()
//        label.text = "ШАР"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(label)
        title = "ШАР"
        
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 69),
//            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
//            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 171)
//        ])
//        
//        label.font = .Neuropol.neuropol.size(of: 64)
//        label.textColor = AppColors.endGradientColor
        
        view.backgroundColor = AppColors.inputBgColor
    }
}
