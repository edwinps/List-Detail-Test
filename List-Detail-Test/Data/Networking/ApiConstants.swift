//
//  ApiConstants.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

enum Environment {

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let apiUrl: URL = {
        guard let apiUrlString = Environment.infoDictionary["API_URL"] as? String,
            let url = URL(string: "http://\(apiUrlString)") else {
            fatalError("Api Url is not set in plist for this environment")
        }
        return url
    }()
}
