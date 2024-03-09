//
//  Extension+Bundle.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

extension Bundle {
    // This extension provides a computed property to retrieve the short version of the iOS application
    var shortVersion: String {
        (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
}
