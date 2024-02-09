//
//  AddKeyPopUpView.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 9.02.24.
//

import UIKit

final class AddKeyPopUpView: UIView {

    //MARK: - Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
    }
    
}
