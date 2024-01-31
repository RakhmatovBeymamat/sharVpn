//
//  Coordinator.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childrenCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(coordinator: Coordinator) {
        childrenCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) {
        childrenCoordinators = childrenCoordinators.filter {$0 !== coordinator}
    }
}
