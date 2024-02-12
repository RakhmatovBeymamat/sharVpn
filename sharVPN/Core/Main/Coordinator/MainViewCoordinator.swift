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
        navigationController.setNavigationBarHidden(true, animated: false)
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
        segue.interactiveHide = true
        segue.dimMode = .none
        segue.configure(layout: .bottomTab)
        segue.messageView.backgroundHeight = 290
        segue.messageView.layoutMarginAdditions = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        segue.perform()
    }
}
