//
//  EnvironmentTests.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 26/8/23.
//

import XCTest
@testable import List_Detail_Test

final class EnvironmentTests: XCTestCase {
    
    func testApiUrl() {
        let apiUrl = try? Environment.apiUrl()
        
        XCTAssertEqual(apiUrl?.absoluteString, "http://localhost:8000")
    }
    
    func testApiUrlNotSetInPlist() {
        let testBundle = Bundle(for: type(of: self))
        
        XCTAssertThrowsError(try Environment.apiUrl(bundle: testBundle)) { error in
            XCTAssertEqual(error as? EnvironmentError, EnvironmentError.apiUrlNotSet)
        }
    }
    
    func testApiUrlPlistFileNotFound() {
        let testBundle = BundleMock(infoDictionary: nil)
        
        XCTAssertThrowsError(try Environment.apiUrl(bundle: testBundle)) { error in
            XCTAssertEqual(error as? EnvironmentError, EnvironmentError.plistFileNotFound)
        }
    }
}
