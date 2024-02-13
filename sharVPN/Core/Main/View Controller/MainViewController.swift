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
import Haptica

final class MainViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - RootView
    typealias RootView = MainView
    
    //MARK: - Services
    internal var coordinator: MainViewCoordinator?
    private let vpn = OutlineVpn.shared
    private var animationLayer: CALayer!
    
    //MARK: - Attributes
    private let viewModel = MainViewModel()
    private let ssURL = "ss://YWVzLTI1Ni1nY206ODg4OTk5@91.215.152.217:8388#%D1%82%D0%B5%D1%81%D1%82"
    
    //MARK: - Actions
    @IBAction func enableButtonAction(_ sender: UIButton) {
        sender.showAnimation()
        Haptic.impact(.soft).generate()
        parseSSURl(url: ssURL)
    }
    
    @IBAction func addKeyBtn(_ sender: UIButton) {
        sender.showAnimation()
        Haptic.impact(.soft).generate()
        coordinator?.presentAddView(viewController: self)
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        sender.showAnimation()
        Haptic.impact(.soft).generate()
        coordinator?.presentAddView(viewController: self)
    }
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func startAnimation() {
        view().arrowImageView.isHidden = false
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 1.0
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        view().arrowImageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    private func stopAnimation() {
        view().arrowImageView.isHidden = true
        view().arrowImageView.layer.removeAnimation(forKey: "rotationAnimation")
    }

    private func parseSSURl(url: String) {
        guard let configJson = viewModel.parseShadowsocksURL(url)?.returnJSON() else {
            showErrorAlert(message: "URL error")
            return }
        
        guard !vpn.isActive("0") else { 
            vpn.stop("0")
            return }
        startAnimation()
        vpn.start("0", configJson: configJson) { [weak self] errorCode in
            guard let `self` = self else { return }
            if errorCode == .noError {
                Haptic.impact(.soft).generate()
                stopAnimation()
            } else {
                stopAnimation()
            }
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
        
        let plusButton = view().plusButton
        plusButton!.addSubview(iconImageView)
        plusButton!.layer.insertSublayer(backgroundLayer, at: 0)
        plusButton!.layer.insertSublayer(background, at: 1)
        
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
            .font: UIFont.Neuropol.neuropol.size(of: 22),
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(sharAttributes, range: NSRange(location: 14, length: 3))
        
        view().addKeyButton.setAttributedTitle(attributedText, for: .normal)
    }
    
}

//MARK: - AddKeyPopUpViewControllerDelegate
extension MainViewController: AddKeyPopUpViewControllerDelegate {
    func didFinishKey(key: String) {
        parseSSURl(url: key)
    }
}

