//
//  MainViewController.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 31.01.24.
//

import UIKit
import OutlineTunnel
import OutlineSentryLogger
import OutlineNotification
import CocoaLumberjack
import CocoaLumberjackSwift
import NetworkExtension
import Sentry

class MainViewController: UIViewController, ViewSpecificController {
    
    //MARK: - RootView
    typealias RootView = MainView
    
    //MARK: - Services
    internal var coordinator: MainViewCoordinator?
    private let vpn = OutlineVpn.shared
    let configJson: [String: Any]? = [
        "host": "91.215.152.217",
        "port": 8388,
        "username": "aes-256-gcm",
        "password": 888999
    ]

    
    @IBAction func enableButtonAction(_ sender: Any) {
        print("test")
        guard let configJson = configJson, containsExpectedKeys(configJson) else { return }
        vpn.start("0", configJson: configJson) { errorCode in
            if errorCode == .noError {
                print("VPN tunnel started successfully")
            } else {
                print("Failed to start VPN tunnel. Error code: \(errorCode.rawValue)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tunnel: \(vpn.isActive("0"))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupPlusBtn()
        setupAddKeyBtn()
        
    }
}
    
extension MainViewController {
    private func apperanceSettings() {

    }
    
    private func containsExpectedKeys(_ configJson: [String: Any]?) -> Bool {
        return configJson?["host"] != nil && configJson?["port"] != nil &&
        configJson?["password"] != nil && configJson?["method"] != nil
    }
    
    private func setupPlusBtn() {
        let buttonSize = view().plusButton.bounds.size
        
        let backgroundLayer = circle(size: buttonSize, color: UIColor.white.withAlphaComponent(0.7).cgColor)
        
        let backgroundSize = CGSize(width: buttonSize.width * 0.8, height: buttonSize.height * 0.8)
        let backgroundOrigin = CGPoint(x: (buttonSize.width - backgroundSize.width) / 2, y: (buttonSize.height - backgroundSize.height) / 2)
        let background = circle(size: backgroundSize, color: UIColor.white.cgColor)
        background.position = CGPoint(x: backgroundLayer.position.x + backgroundOrigin.x - (buttonSize.width - backgroundSize.width) / 2, y: backgroundLayer.position.y + backgroundOrigin.y - (buttonSize.height - backgroundSize.height) / 2)
        
        let iconImageView = UIImageView(image: UIImage(systemName: "plus"))
        iconImageView.tintColor = .appColor(.lightPink)
        iconImageView.center = CGPoint(x: buttonSize.width / 2, y: buttonSize.height / 2)
        
        view().plusButton.layer.addSublayer(backgroundLayer)
        view().plusButton.layer.addSublayer(background)
        view().plusButton.addSubview(iconImageView)
    }

    
    private func setupAddKeyBtn() {
        
        
        lazy var gradientLayer: CAGradientLayer = {
            let l = CAGradientLayer()
            l.frame = view().addKeyButton.bounds
            l.colors = [UIColor.appColor(.lightBlue), UIColor.appColor(.darkPink)]
            l.startPoint = CGPoint(x: 0, y: 0.5)
            l.endPoint = CGPoint(x: 1, y: 0.5)
            l.cornerRadius = 40
            view().addKeyButton.layer.insertSublayer(l, at: 0)
            return l
        }()
        
        gradientLayer.frame = view().addKeyButton.bounds
        view().addKeyButton.layer.cornerRadius = 40
        
        setupCustomTextButton()
        
    }

    private func circle(size: CGSize, color: CGColor) -> CALayer {
        let layer = CALayer()
        layer.bounds = CGRect(origin: .zero, size: size)
        layer.position = CGPoint(x: size.width / 2, y: size.height / 2)
        layer.cornerRadius = size.width / 2
        layer.backgroundColor = color
        
        return layer
    }
    
    private func setupCustomTextButton() {
        
        let attributedText = NSMutableAttributedString(string: "Добавить ключ ШАР")
        
        // Атрибуты для слова "Добавить ключ"
        let addKeyAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.MontserratAlternates.medium.size(of: 22),
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(addKeyAttributes, range: NSRange(location: 0, length: 13))
        
        // Атрибуты для слова "ШАР"
        let sharAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.Neuropol.neuropol.size(of: 22),
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(sharAttributes, range: NSRange(location: 14, length: 3))
        
        view().addKeyButton.setAttributedTitle(attributedText, for: .normal)
        
    }
}




