//
//  CustomTableViewCell.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 13/02/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    func animateCell(_ bool: Bool) {
        if bool {
            UIView.animate(withDuration: 0.25) {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.transform = .identity
            }
        }
    }

    override var isHighlighted: Bool {
        didSet {
            animateCell(isHighlighted)
        }
    }
}
