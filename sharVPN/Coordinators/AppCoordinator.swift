//
//  AppCoordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AppCoordinator {
    private var window: UIWindow
    private var tabBarController: UITabBarController
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let mainViewModel = MainViewControllerModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)
        let mainNavigationController = UINavigationController(rootViewController: mainViewController)
        mainNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.vpn, image: UIImage(named: Resources.Images.TabBar.vpn), selectedImage: nil)
        
        let secondViewModel = AboutViewControllerModel()
        let secondViewController = AboutViewController(viewModel: secondViewModel)
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        secondNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.about, image: UIImage(named: Resources.Images.TabBar.about), selectedImage: nil)
        
        tabBarController.viewControllers = [mainNavigationController, secondNavigationController]
        tabBarController.tabBar.backgroundColor = .white
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}

//class AppCoordinator: BaseCoordinator {
//    
//    private var window: UIWindow
//    private var tabBarController = UITabBarController()
//    private var mainNavigationController = UINavigationController()
//
//    private var aboutNavigationController = UINavigationController()
//    
//    init(window: UIWindow) {
//        self.window = window
//        self.window.rootViewController = tabBarController
//        self.window.makeKeyAndVisible()
//        
//        // Добавляем navigation controller в tab bar controller
//        tabBarController.viewControllers = [mainNavigationController, aboutNavigationController]
//    }
//    
//    override func start() {
//        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: mainNavigationController)
//        add(coordinator: mainViewControllerCoordinator)
//        mainViewControllerCoordinator.start()
//        
//        let aboutViewControllerCoordinator = AboutViewControllerCoordinator(navigationController: aboutNavigationController)
//        add(coordinator: aboutViewControllerCoordinator)
//        aboutViewControllerCoordinator.start()
//        
//        // Установка иконок для вкладок
//        mainNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.vpn, image: UIImage(named: Resources.Images.TabBar.vpn), selectedImage: UIImage(named: Resources.Images.TabBar.vpn))
//        
//        aboutNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.about, image: UIImage(named: Resources.Images.TabBar.about), selectedImage: UIImage(named: Resources.Images.TabBar.about))
//        
//        //Кастомизация UITabBarItem
//        
//        let normalAttributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font: UIFont.MontserratAlternates.regular.size(of: 14),
//            NSAttributedString.Key.foregroundColor: AppColors.tabBarItemColor
//        ]
//        
//        mainNavigationController.tabBarItem.setBadgeTextAttributes(normalAttributes, for: .normal)
//        mainNavigationController.tabBarItem.setBadgeTextAttributes(normalAttributes, for: .selected)
//        
//        aboutNavigationController.tabBarItem.setBadgeTextAttributes(normalAttributes, for: .normal)
//        aboutNavigationController.tabBarItem.setBadgeTextAttributes(normalAttributes, for: .selected)
//    }
//    
//}
