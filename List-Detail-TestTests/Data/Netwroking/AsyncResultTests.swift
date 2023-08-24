//
//  AsyncResultTests.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

struct TestError: Error { }

final class AsyncResultTests: XCTestCase {
    func testGetDataSuccess() async throws {
        let result: AsyncResult<Int, Error> = .success(42)
        let value = try await result.getData()
        XCTAssertEqual(value, 42)
    }
    
    func testGetDataFailure() async throws {
        let result: AsyncResult<Int, Error> = .failure(TestError())
        do {
            let _ = try await result.getData()
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertTrue(error is TestError)
        }
    }
}
