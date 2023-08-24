//
//  RemoteImageViewModelTest.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

class RemoteImageViewModelTests: XCTestCase {
    var viewModel: RemoteImageViewModel!
    var mockUseCase: MockLoadImageUseCase!
    var url: URL!

    override func setUp() {
        super.setUp()
        mockUseCase = MockLoadImageUseCase()
        url = URL(string: "https://example.com/image.jpg")!
        viewModel = RemoteImageViewModel(url: url, loadImageUseCase: mockUseCase)
    }

    override func tearDown() {
        mockUseCase = nil
        url = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadImageSuccess() async {
        mockUseCase.result = .success(Data())
        
        await viewModel.loadImage()
        
        let expectation = XCTestExpectation(description: "Movies updated")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.imageData, Data())
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 1.0)
    }
    
    func testLoadImageFailure() async {
        mockUseCase.result = .failure(NSError(domain: "test", code: 1, userInfo: nil))
        
        await viewModel.loadImage()
        
        XCTAssertNil(viewModel.imageData)
    }
}
