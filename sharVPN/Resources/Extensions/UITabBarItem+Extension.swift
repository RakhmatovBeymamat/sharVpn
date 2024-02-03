//
//  UITabBarItem+Extension.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 2.02.24.
//

import UIKit

extension UITabBarItem {
    func setImageOnly() {
        imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let customFont = UIFont.MontserratAlternates.regular.size(of: 12)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: customFont,
            .foregroundColor: UIColor.black,
        ]
        
        setTitleTextAttributes(attributes, for: .normal)
        setTitleTextAttributes(attributes, for: .selected)
    }
}
