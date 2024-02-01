//
//  MainViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewControllerModel
        
    init(viewModel: MainViewControllerModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let label = UILabel()
//        label.text = "ШАР"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(label)
        
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 69),
//            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
//            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 171)
//        ])
//        
//        label.font = .Neuropol.neuropol.size(of: 64)
//        label.textColor = AppColors.endGradientColor
        navigationItem.title = "ШАР"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = AppColors.inputBgColor
    }
}
