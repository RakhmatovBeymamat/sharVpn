//
//  ContactsDataProvider.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 13/02/24.
//

import UIKit
import Haptica

final class ContactsDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    //MARK: - Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    //MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableCell.defaultReuseIdentifier) as? ContactsTableCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = viewController as? AboutViewController else { return }
        Haptic.impact(.soft).generate()
        viewController.openMail()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}
