//
//  ViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 30.01.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "ШАР"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        ])
        
        label.font = .Neuropol.neuropol.size(of: 64)
        label.textColor = AppColors.endGradientColor
        
        view.backgroundColor = AppColors.inputBgColor
        
    }

    
    
    

}

