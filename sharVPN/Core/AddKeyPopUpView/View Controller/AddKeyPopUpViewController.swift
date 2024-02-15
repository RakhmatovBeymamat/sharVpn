//
//  AddKeyPopUpViewController.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 09/02/24.
//

import UIKit

protocol AddKeyPopUpViewControllerDelegate: NSObject {
    func didFinishKey(key: String)
}

final class AddKeyPopUpViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = AddKeyPopUpView
    
    //MARK: - Services
    internal var coordinator: MainViewCoordinator?
    private var defaults = UserDefaults.standard
    
    //MARK: - Attributes
    weak var delegate: AddKeyPopUpViewControllerDelegate?
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

//MARK: - Other funcs
extension AddKeyPopUpViewController {
    private func appearanceSettings() {
        view().input.delegate = self
        
        if let savedKey = defaults.value(forKey: "key") as? String {
            view().input.text = savedKey
        } else {
            view().input.text = ""
        }
    }
}

//MARK: - UITextFieldDelegate
extension AddKeyPopUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = view().input.text, !text.isEmpty else { return false }
        delegate?.didFinishKey(key: text)
        dismiss(animated: true)
        return true
    }
}
