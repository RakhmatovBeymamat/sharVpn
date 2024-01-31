//
//  SceneDelegate.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 30.01.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        if let window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }
        
    }

}

