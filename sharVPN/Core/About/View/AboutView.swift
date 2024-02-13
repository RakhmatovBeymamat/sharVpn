//
//  AboutView.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 2.02.24.
//

import UIKit

final class AboutView: CustomView {
        
    //MARK: - Outlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var contactsTableView: UITableView! {
        didSet {
            contactsTableView.register(UINib(nibName: ContactsTableCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: ContactsTableCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var licenseTableView: UITableView! {
        didSet {
            licenseTableView.register(UINib(nibName: LicenseTableCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: LicenseTableCell.defaultReuseIdentifier)
            licenseTableView.layer.cornerRadius = 20
        }
    }
}
