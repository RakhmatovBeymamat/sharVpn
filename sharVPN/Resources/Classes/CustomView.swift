//
//  CustomView.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 2.02.24.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundColor()
    }
    
    // MARK: - UI Setup
    private func setupBackgroundColor() {
        backgroundColor = .appColor(.mainBackground)
    }
}
