//
//  CoordinatorTest.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

class CoordinatorTests: XCTestCase {
    var coordinator: Coordinator!
    var useCase: MockMovieUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = MockMovieUseCase()
        coordinator = Coordinator(movieUseCase: useCase)
    }
    
    override func tearDown() {
        coordinator = nil
        useCase = nil
        super.tearDown()
    }
    
    func testPushPage() {
        coordinator.push(.list)
        XCTAssertEqual(coordinator.path.count, 1)
    }
    
    func testPopPage() {
        coordinator.push(.list)
        coordinator.pop()
        XCTAssert(coordinator.path.isEmpty)
    }
    
    func testBuildListPage() {
        let page = coordinator.build(page: .list)
        XCTAssertNotNil(page)
    }
    
    func testBuildDetailPageWithMovieID() {
        coordinator.movieID = 123
        let page = coordinator.build(page: .detail)
        XCTAssertNotNil(page)
    }
    
    func testRawValue() {
        XCTAssertEqual(Page.list.id, "list")
        XCTAssertEqual(Page.detail.id, "detail")
    }
}
