//
//  TabBarController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarControlles: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControlles {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
