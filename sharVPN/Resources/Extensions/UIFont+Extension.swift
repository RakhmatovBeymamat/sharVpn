//
//  UIFont+Extension.swift
//  sharVPN
//
//  Created by Rakhmatov Beymamat on 30.01.24.
//

import UIKit

extension UIFont {
    
    enum Neuropol {
        enum neuropol {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Neuropol.neuropol, size: size)!
            }
        }
    }
    
    enum MontserratAlternates {
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.MontserratAlternates.bold, size: size)!
            }
        }
        
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.MontserratAlternates.light, size: size)!
            }
        }
        
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.MontserratAlternates.medium, size: size)!
            }
        }
        
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.MontserratAlternates.regular, size: size)!
            }
        }
        
        enum semiBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.MontserratAlternates.semiBold, size: size)!
            }
        }
    }
    
}

private extension UIFont {
    enum Constants {
        
        enum Neuropol {
            static let neuropol = "NeuropolXRg-Regular"
        }
        
        enum MontserratAlternates {
            static let bold = "MontserratAlternates-Bold"
            static let light = "MontserratAlternates-Light"
            static let medium = "MontserratAlternates-Medium"
            static let regular = "MontserratAlternates-Regular"
            static let semiBold = "MontserratAlternates-SemiBold"
        }
    }
}
