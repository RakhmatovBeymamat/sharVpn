//
//  AboutViewControllerCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AboutViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let aboutViewController = AboutViewController()
        aboutViewController.aboutViewControllerCoordinator = self
        navigationController.pushViewController(aboutViewController, animated: true)
    }
}
