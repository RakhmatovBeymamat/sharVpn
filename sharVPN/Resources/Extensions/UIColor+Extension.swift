//
//  UIColor+Extension.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit

extension UIColor {
    static func appColor(_ named: AppColors) -> UIColor {
        return UIColor(named: named.rawValue) ?? .clear
    }
}
