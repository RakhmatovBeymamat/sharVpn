//
//  AboutViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit

class AboutViewController: UIViewController, ViewSpecificController {
    
    let dataForTableView = ContactsTableData.data()
    
    //MARK: - Root View
    typealias RootView = AboutView
    
    //MARK: - Services
    internal var coordinator: AboutViewCoordinator?
    
    @IBOutlet weak var contactsTableView: UITableView!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.register(ContactsTableCell.nib(), forCellReuseIdentifier: ContactsTableCell.identifier)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    
}


extension AboutViewController: UITableViewDelegate, UITableViewDataSource  {
    private func apperanceSettings() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForTableView.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: ContactsTableCell.identifier, for: indexPath) as! ContactsTableCell
        
        customCell.configure(with: dataForTableView[indexPath.row].text, image: dataForTableView[indexPath.row].image)
         
        return customCell
    }
}
