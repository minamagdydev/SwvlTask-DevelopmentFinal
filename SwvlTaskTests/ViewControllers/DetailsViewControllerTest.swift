//
//  DetailsViewControllerTest.swift
//  SwvlTaskTests
//
//  Created by lujin sherif  on 6/5/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest
@testable import SwvlTask
class DetailsViewControllerTest: XCTestCase {
    var sut: DetailsViewController!
    
    override func setUp() {
        
        
        let storyboard = UIStoryboard(name: StoryboardNames.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: ViewControllerIds.DetailsViewController)
        sut = (viewController as! DetailsViewController)
        
        _ = sut.view
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
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.movieImageCollectionView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.movieImageCollectionView.dataSource is DetailsViewController)
    }
    
    

}
