//
//  MainViewCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit
import SwiftMessages

final class MainViewCoordinator: Coordinator {
    internal var childCoordinators: [Coordinator] = []
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = MainViewController()
        vc.tabBarItem =  UITabBarItem(title: Localize.TabBar.vpn, image: UIImage.appImage(.tabBarVpn), tag: 0)
        vc.tabBarItem.setImageOnly()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    internal func presentAddView(viewController: UIViewController) {
        let vc = AddKeyPopUpViewController()
        vc.coordinator = self
        if let viewController = viewController as? MainViewController {
            vc.delegate = viewController
        }
        let segue = SwiftMessagesSegue(identifier: nil, source: viewController, destination: vc)
        segue.interactiveHide = false
        segue.configure(layout: .bottomTab)
        segue.messageView.backgroundHeight = 264.0
        segue.perform()
    }
}
