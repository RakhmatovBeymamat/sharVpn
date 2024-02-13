//
//  Bundle+Extenstion.swift
//  sharVPN
//
//  Created by Хасан Давронбеков on 12/02/24.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
