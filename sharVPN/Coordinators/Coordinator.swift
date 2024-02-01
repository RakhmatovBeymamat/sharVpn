//
//  Coordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
