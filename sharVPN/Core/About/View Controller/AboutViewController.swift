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

    @IBOutlet weak var licenseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        licenseTableView.register(LicenseTableCell.nib(), forCellReuseIdentifier: LicenseTableCell.identifier)
        contactsTableView.register(ContactsTableCell.nib(), forCellReuseIdentifier: ContactsTableCell.identifier)
        
        licenseTableView.delegate = self
        licenseTableView.dataSource = self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        contactsTableView.backgroundColor = .appColor(.mainBackground)
        licenseTableView.layer.cornerRadius = 20
        
        getVersion()
        setupText()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


extension AboutViewController {
    private func apperanceSettings() {
        
    }
    
    private func getVersion() {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {return}
        view().versionLabel.text = "Версия \(version)"
    }
    
    private func setupText() {
        let attributedString = NSMutableAttributedString(string: Localize.AboutViewLoc.aboutText)
        
        let sharRange = (Localize.AboutViewLoc.aboutText as NSString).range(of: "ШАР")
        let sharAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.MontserratAlternates.semiBold.size(of: 12),
            .foregroundColor: UIColor.appColor(.lightBlue)
        ]
        
        attributedString.addAttributes(sharAttributes, range: sharRange)
        
        let jigsawRange = (Localize.AboutViewLoc.aboutText as NSString).range(of: "Jigsaw")
        let shadowSocksRange = (Localize.AboutViewLoc.aboutText as NSString).range(of: "Shadowsocks")
        let att: [NSAttributedString.Key: Any] = [
            .font: UIFont.MontserratAlternates.semiBold.size(of: 12),
            .foregroundColor: UIColor.appColor(.lightBlack)
        ]
        
        attributedString.addAttributes(att, range: jigsawRange)
        attributedString.addAttributes(att, range: shadowSocksRange)
        
        view().aboutLabel.attributedText = attributedString
    }
}


//MARK: - Расширение с методы TableView
extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Методы для настройки ContactsTableView и LicenseTableView
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return contactsTableView == tableView ? 1.0 : 1.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == contactsTableView ? dataForTableView.count : 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == contactsTableView {
            let customCell = tableView.dequeueReusableCell(withIdentifier: ContactsTableCell.identifier,
                                                           for: indexPath) as! ContactsTableCell
            
            customCell.configure(with: dataForTableView[indexPath.row].text,
                                 image: dataForTableView[indexPath.row].image)

            customCell.backgroundColor = UIColor.white
            customCell.layer.cornerRadius = 20
            customCell.clipsToBounds = true
            
            return customCell
            
        } else if tableView == licenseTableView {
            let customCell = tableView.dequeueReusableCell(withIdentifier: LicenseTableCell.identifier, for: indexPath) as! LicenseTableCell
            customCell.labelText.text = LicenseTableCell.data[indexPath.row]
            
            return customCell
        }
        
        return UITableViewCell()
            
    }
}
