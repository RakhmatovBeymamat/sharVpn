//
//  AboutViewCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import Foundation
import UIKit

final class AboutViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AboutViewController()
        vc.tabBarItem = UITabBarItem(title: Localize.TabBar.about, image: .appImage(.tabBarAbout), tag: 1)
        vc.tabBarItem.setImageOnly()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
