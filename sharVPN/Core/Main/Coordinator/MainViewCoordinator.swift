//
//  MainViewCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit

final class MainViewCoordinator: Coordinator {
    internal var childCoordinators: [Coordinator] = []
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController()
        vc.tabBarItem =  UITabBarItem(title: Localize.TabBar.vpn, image: UIImage.appImage(.tabBarVpn), tag: 0)
        vc.tabBarItem.setImageOnly()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
    }
}
