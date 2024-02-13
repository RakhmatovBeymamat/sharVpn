//
//  AboutViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit
import QuickLook
import MessageUI

final class AboutViewController: UIViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = AboutView
    
    //MARK: - Services
    internal var coordinator: AboutViewCoordinator?
    
    //MARK: - Attributes
    private let dataProvider = AboutDataProvider()
    private let contactsDataProvider = ContactsDataProvider()
    internal var selectedFileName: String? {
        didSet {
            guard let _ = selectedFileName else { return }
            openFile()
        }
    }
    
    internal var data: [LicensesModel]? {
        didSet {
            guard let data = data else { return }
            dataProvider.tableView = view().licenseTableView
            dataProvider.items = data
        }
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        apperanceSettings()
        getVersion()
        setupText()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: - Other funcs
extension AboutViewController {
    private func apperanceSettings() {
        dataProvider.viewController = self
        contactsDataProvider.viewController = self
        contactsDataProvider.tableView = view().contactsTableView

        self.data = [LicensesModel(name: "Конфиденциальность", fileName: "attribution"),
                     LicensesModel(name: "Сбор данных", fileName: "conditions"),
                     LicensesModel(name: "Лицензии", fileName: "dataCollection"),
                     LicensesModel(name: "Условия использования", fileName: "politicy")]
    }
    
    private func getVersion() {
        guard let version = Bundle.main.releaseVersionNumber else {return}
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
    
    private func openFile() {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }
}

//MARK: - QLPreviewControllerDataSource
extension AboutViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let selectedFileName = selectedFileName,
              let fileURL = Bundle.main.url(forResource: selectedFileName, withExtension: "docx") else {
            fatalError("Could not find file: \(String(describing: selectedFileName))")
        }
        return fileURL as QLPreviewItem
    }
}

//MARK: - MFMailComposeViewControllerDelegate
extension AboutViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    internal func openMail() {
        let recipientEmail = "sharvpn@gmail.com"
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients([recipientEmail])
            mailComposer.setSubject("Subject")
            mailComposer.setMessageBody("Message body", isHTML: false)
            present(mailComposer, animated: true, completion: nil)
        } else {
            print("Mail services are not available")
        }
    }
}
