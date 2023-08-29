//
//  List_Detail_TestUITests.swift
//  List-Detail-TestUITests
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import XCTest

final class List_Detail_TestUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testNavigateToDetail() {
        let buttonElement = app.collectionViews.cells.firstMatch
        let buttonLabel = buttonElement.buttons.firstMatch.label
        buttonElement.tap()
        
        XCTAssertTrue(app.navigationBars[buttonLabel].exists)
    }
    
    func testRefreshMovies() {
        let startPoint = app.collectionViews.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2))
        let endPoint = app.collectionViews.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.8))

        startPoint.press(forDuration: 0.5, thenDragTo: endPoint)
        
        XCTAssertTrue(app.collectionViews.cells.count > 0)
    }
    
    func testNavigateToDetailAndBack() {
        let buttonElement = app.collectionViews.cells.firstMatch
        let buttonLabel = buttonElement.buttons.firstMatch.label
        buttonElement.tap()
        XCTAssertTrue(app.navigationBars[buttonLabel].exists)
        
        // Navigate back
        app.navigationBars.buttons.firstMatch.tap()
        XCTAssertTrue(app.navigationBars["Movies"].exists)
    }
    
    func testListContent() {
        let cell = app.collectionViews.cells.firstMatch
        let button = cell.buttons.firstMatch
        
        XCTAssertTrue(cell.exists)
        XCTAssertTrue(button.exists)
    }
}
