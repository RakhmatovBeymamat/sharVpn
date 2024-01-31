//
//  BaseCoordinators.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import Foundation


class BaseCoordinator: Coordinator {
    var childrenCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("children must be writed to Coordinator protocol")
    }
    
    
}
