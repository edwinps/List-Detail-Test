//
//  MovieListCoordinatorTest.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

final class CoordinatorViewModelTest: XCTestCase {
    var coordinatorViewModel: CoordinatorViewModel!
    
    override func setUp() {
        super.setUp()
        coordinatorViewModel = CoordinatorViewModel()
    }
    
    override func tearDown() {
        coordinatorViewModel = nil
        super.tearDown()
    }
    
    func testNavigateToList() {
        coordinatorViewModel.navigate(to: .list)
        
        XCTAssertEqual(coordinatorViewModel.path.count, 1)
    }
    
    func testNavigateToDetail() {
        let movieId = 123
    
        coordinatorViewModel.navigate(to: .detail(id: movieId))
        
        XCTAssertEqual(coordinatorViewModel.path.count, 1)
    }
    
    func testPop() {
        coordinatorViewModel.navigate(to: .list)
        coordinatorViewModel.pop()
        
        XCTAssertEqual(coordinatorViewModel.path.count, 0)
    }
    
    func testBuildViewForList() {
        let destination: Destination = .list
        
        let view = coordinatorViewModel.buildView(for: destination)
        
        XCTAssertNotNil(view)
    }
    
    func testBuildViewForDetail() {
        let movieId = 123
        let destination: Destination = .detail(id: movieId)
        
        let view = coordinatorViewModel.buildView(for: destination)
        
        XCTAssertNotNil(view)
    }
}
