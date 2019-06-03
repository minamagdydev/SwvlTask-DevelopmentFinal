//
//  HomeViewModel.swift
//  SwvlTaskTests
//
//  Created by lujin sherif  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest
@testable import SwvlTask
class HomeViewModelTests: XCTestCase {

    var fileReaderMock: SWVLFileReaderMock!
    var homeViewModel: HomeViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fileReaderMock = SWVLFileReaderMock()
        homeViewModel = HomeViewModel(fileReader: fileReaderMock)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_getMovies_onSucces_callGetFileData() {
        homeViewModel.getMovies(onSuccess: { _ in
            
        }) { _ in
            
        }
        XCTAssertTrue(fileReaderMock.getFileDataIsCalled)
    }

}
