//
//  ContactsTableData.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 12/02/24.
//

import UIKit

struct ContactsTableData {
    
    var text: String
    var image: UIImage
    
    static func data() -> [ContactsTableData] {
        return [
            ContactsTableData(text: "Служба заботы: sharvpn@gmail.com", image: .appImage(.emailIcon))
        ]
    }
}
