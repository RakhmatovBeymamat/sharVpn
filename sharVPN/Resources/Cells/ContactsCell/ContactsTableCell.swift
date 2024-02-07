//
//  ContactsTableCell.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 5.02.24.
//

import UIKit

class ContactsTableCell: UITableViewCell {
    
    static let identifier = "contactsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ContactsTableCell", bundle: nil)
    }
    
    public func configure(with title: String, image: UIImage) {
        cellLabel.text = title
        cellIcon.image = image
    }

    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
}

struct ContactsTableData {
    
    var text: String
    var image: UIImage
    
    static func data() -> [ContactsTableData] {
        return [
            ContactsTableData(text: "Чат со службой заботы", image: .appImage(.supportChatIcon)),
            ContactsTableData(text: "Telegram:", image: .appImage(.telegramIcon)),
            ContactsTableData(text: "E-mail:  sharvpn@gmail.com ", image: .appImage(.emailIcon))
        ]
    }
}
