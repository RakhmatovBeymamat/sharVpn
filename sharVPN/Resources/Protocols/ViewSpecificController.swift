//
//  ViewSpecificController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 2.02.24.
//

import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
