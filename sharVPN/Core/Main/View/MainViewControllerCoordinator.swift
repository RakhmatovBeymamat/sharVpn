//
//  MainViewControllerCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class MainViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.mainViewControllerCoordinator = self
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func runAboutViewController() {
        let aboutViewControllerCoordinator = AboutViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: aboutViewControllerCoordinator)
        aboutViewControllerCoordinator.start()
    }
}
