//
//  LicenseTableCell.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 8.02.24.
//

import UIKit

class LicenseTableCell: UITableViewCell {

    static let identifier = "licenseCell"
    
    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var data = ["Конфиденциальность",
                       "Сбор данных",
                       "Лицензии",
                       "Условия использования"
    ]
    
}

extension LicenseTableCell {
    static func nib() -> UINib {
        return UINib(nibName: "LicenseTableCell", bundle: nil)
    }
}


