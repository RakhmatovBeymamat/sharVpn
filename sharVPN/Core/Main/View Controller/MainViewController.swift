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
import SwiftMessages

class MainViewController: UIViewController, ViewSpecificController {
    
    //test mainViewModel methods
    let viewModel = MainViewModel()
    let ssURL = "ss://YWVzLTI1Ni1nY206ODg4OTk5@91.215.152.217:8388#%D1%82%D0%B5%D1%81%D1"
    
    //MARK: - RootView
    typealias RootView = MainView
    
    //MARK: - Services
    internal var coordinator: MainViewCoordinator?
    private let vpn = OutlineVpn.shared
    private var animationLayer: CALayer!
    
    //MARK: - Attributes
    private let configJson: [String: Any]? = [
        "host": "91.215.152.217",
        "port": 8388,
        "username": "aes-256-gcm",
        "password": 888999
    ]
    
    //MARK: - Actions
    @IBAction func enableButtonAction(_ sender: Any) {
        print("test")
        startAnimation()
        guard let configJson = configJson, containsExpectedKeys(configJson) else { return }
        vpn.start("0", configJson: configJson) { errorCode in
            if errorCode == .noError {
                print("VPN tunnel started successfully")
            } else {
                print("Failed to start VPN tunnel. Error code: \(errorCode.rawValue)")
            }
        }
    }
    
    @IBAction func addKeyBtn(_ sender: Any) {
        print("working")
        coordinator?.presentAddView(viewController: self)
        parseSSURl(url: ssURL)
    }
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tunnel: \(vpn.isActive("0"))")
        apperanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupPlusBtn()
        setupAddKeyBtn()
    }
}

//MARK: - Other funcs
extension MainViewController {
    private func apperanceSettings() {
        view().titleLabel.text = Localize.MainViewLoc.title
        view().titleLabel.font = UIFont.Neuropol.neuropol.size(of: 64)
    }
    
    private func containsExpectedKeys(_ configJson: [String: Any]?) -> Bool {
        return configJson?["host"] != nil && configJson?["port"] != nil &&
        configJson?["password"] != nil && configJson?["username"] != nil
    }
    
    private func startAnimation() {
        view().arrowImageView.isHidden = false
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 1.0
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        view().arrowImageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    private func parseSSURl(url: String) {
        if let test = viewModel.parseShadowsocksURL(url) {
            print("")
            print("---------------------------------")
            print("Server: - \(test.host)")
            print("Port: - \(test.port)")
            print("Method: - \(test.encryptionMethod)")
            print("Password: - \(test.password)")
        }
    }
    
    //MARK: - Настройка круглой кнопки
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
        let addKeyAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.MontserratAlternates.medium.size(of: 22),
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(addKeyAttributes, range: NSRange(location: 0, length: 13))
        
        let sharAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.MontserratAlternates.light.size(of: 22),
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(sharAttributes, range: NSRange(location: 14, length: 3))
        
        view().addKeyButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    //    func animateArrow() {
    //        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear, .repeat], animations: {
    //            self.arrowView.transform = CGAffineTransform(rotationAngle: .pi)
    //        }, completion: nil)
    //    }
}

//MARK: - AddKeyPopUpViewControllerDelegate
extension MainViewController: AddKeyPopUpViewControllerDelegate {
    func didFinishKey(key: String) {
        parseSSURl(url: key)
    }
}

