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
        vc.tabBarItem = UITabBarItem(title: Localize.TabBar.vpn, image: .appImage(.tabBarVpn), selectedImage: .appImage(.tabBarVpn))
        vc.tabBarItem.tag = 0
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
