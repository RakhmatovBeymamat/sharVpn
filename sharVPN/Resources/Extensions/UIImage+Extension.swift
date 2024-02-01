//
//  UIImage+Extension.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 1.02.24.
//

import UIKit

extension UIImage {
    static func appImage(_ named: AppImages) -> UIImage {
        return UIImage(named: named.rawValue) ?? UIImage()
    }
}
