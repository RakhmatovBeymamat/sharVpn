//
//  AboutViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AboutViewController: UIViewController {
    
    weak var aboutViewControllerCoordinator: AboutViewControllerCoordinator?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "About"
    }

}
