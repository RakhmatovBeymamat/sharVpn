//
//  AppCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    private var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        return tabBarController
    }()
    
    private var mainNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    private var aboutNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
        
        // Добавляем navigation controller в tab bar controller
        tabBarController.viewControllers = [mainNavigationController, aboutNavigationController]
    }
    
    override func start() {
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: mainNavigationController)
        add(coordinator: mainViewControllerCoordinator)
        mainViewControllerCoordinator.start()
        
        let aboutViewControllerCoordinator = AboutViewControllerCoordinator(navigationController: aboutNavigationController)
        add(coordinator: aboutViewControllerCoordinator)
        aboutViewControllerCoordinator.start()
        
        // Установка иконок для вкладок
        mainNavigationController.tabBarItem = UITabBarItem(title: "VPN", image: UIImage(systemName: "lock.fill"), selectedImage: UIImage(systemName: "lock.fill"))
        
        aboutNavigationController.tabBarItem = UITabBarItem(title: "О приложении", image: UIImage(systemName: "lock.fill"), selectedImage: UIImage(systemName: "lock.fill"))
    }
    
}
