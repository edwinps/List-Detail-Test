//
//  BundleMock.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 26/8/23.
//

import XCTest
@testable import List_Detail_Test

class BundleMock: Bundle {
    private let mockInfoDictionary: [String: Any]?
    
    init(infoDictionary: [String: Any]?) {
        self.mockInfoDictionary = infoDictionary
        super.init()
    }
    
    override var infoDictionary: [String: Any]? {
        return mockInfoDictionary
    }
}
