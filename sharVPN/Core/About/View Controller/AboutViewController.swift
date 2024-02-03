//
//  AboutViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AboutViewController: UIViewController {
    
    //MARK: - Root View
    typealias RootView = AboutView
    
    //MARK: - Services
    internal var coordinator: AboutViewCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}


extension AboutViewController {
    private func apperanceSettings() {
        
    }
}
