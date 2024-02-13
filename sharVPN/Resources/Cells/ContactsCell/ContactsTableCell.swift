//
//  ContactsTableCell.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 5.02.24.
//

import UIKit

final class ContactsTableCell: CustomTableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
}
