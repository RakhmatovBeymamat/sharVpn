//
//  MainTabBarController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit

final class TabBarController: UITabBarController {

    internal var mainCoordinator = MainViewCoordinator(navigationController: UINavigationController())
    internal var aboutCoordinator = AboutViewCoordinator(navigationController: UINavigationController())
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        createControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editAppereance()
    }

    
    
}


extension TabBarController {
    func createControllers() {
        mainCoordinator.start()
        aboutCoordinator.start()
        
        viewControllers = [mainCoordinator.navigationController,
                           aboutCoordinator.navigationController]
    }
    
    func editAppereance() {
        tabBar.setup()
    }
}
