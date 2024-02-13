//
//  ReusableView.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 12/02/24.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
