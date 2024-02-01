//
//  MainViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class MainViewController: UIViewController {
    
    
    //fileprivate var backgroundImageView = UIImageView(image: UIImage(named: Localize.Images.background))
    var coordinator: MainViewCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(.lightPink)
//        setupBackground()
//        titleLabel()
//        setupNavAddBtn()
        
    }
    
    //MARK: - Метод для создание title в главном экране
    private func titleLabel() {
        let label = UILabel()
        label.text = "ШАР"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11),
        ])
        
        label.font = .Neuropol.neuropol.size(of: 64)
//        label.textColor = AppColors.titleColor
    }
    
    //MARK: - Метод для создание кнопка добавить круглая
    private func setupNavAddBtn() {
        let preViewBtn = circle(frame: CGSize(width: 45, height: 45), background: .white.withAlphaComponent(0.7))
        preViewBtn.layer.shadowColor = UIColor(red: 40/255, green: 43/255, blue: 111/255, alpha: 0.15).cgColor
        preViewBtn.layer.shadowOpacity = 1.0
        preViewBtn.layer.shadowOffset = CGSize(width: 0, height: 8.5)
        preViewBtn.layer.shadowRadius = 38.5
        preViewBtn.layer.shadowPath = UIBezierPath(roundedRect: preViewBtn.bounds, cornerRadius: preViewBtn.frame.width / 2).cgPath
        
        let viewBtn = circle(frame: CGSize(width: 32, height: 32), background: .white)
        viewBtn.layer.shadowColor = UIColor(red: 40/255, green: 43/255, blue: 111/255, alpha: 0.15).cgColor
        viewBtn.layer.shadowOpacity = 1.0
        viewBtn.layer.shadowOffset = CGSize(width: 0, height: 8)
        viewBtn.layer.shadowRadius = 39
        viewBtn.layer.shadowPath = UIBezierPath(roundedRect: viewBtn.bounds, cornerRadius: viewBtn.frame.width / 2).cgPath
        
        preViewBtn.translatesAutoresizingMaskIntoConstraints = false
        viewBtn.translatesAutoresizingMaskIntoConstraints = false
            
        view.addSubview(preViewBtn)
        preViewBtn.addSubview(viewBtn)
            
        
        // Определение констрейнтов для customView
        NSLayoutConstraint.activate([
            preViewBtn.widthAnchor.constraint(equalToConstant: 45),
            preViewBtn.heightAnchor.constraint(equalToConstant: 45),
            preViewBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            preViewBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            viewBtn.centerXAnchor.constraint(equalTo: preViewBtn.centerXAnchor),
            viewBtn.centerYAnchor.constraint(equalTo: preViewBtn.centerYAnchor),
            viewBtn.widthAnchor.constraint(equalToConstant: 32),
            viewBtn.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupBackground() {
//        backgroundImageView.contentMode = .scaleAspectFit
//        view.addSubview(backgroundImageView)
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
}


extension MainViewController {
    private func circle(frame: CGSize, background: UIColor) -> UIView {
        let circle = UIView()
        circle.backgroundColor = background
        circle.frame.size = frame
        circle.layer.cornerRadius = frame.width / 2
        return circle
    }
}


