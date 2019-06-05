//
//  HomeViewControllerTest.swift
//  SwvlTaskTests
//
//  Created by minamagdy  on 6/5/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest
import UIKit
@testable import SwvlTask
class HomeViewControllerTest: XCTestCase {
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: StoryboardNames.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: ViewControllerIds.HomeViewController)
        sut = (viewController as! HomeViewController)
        
        _ = sut.view
    }
   

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
// tableview
   
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.moviesListTableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.moviesListTableView.dataSource is HomeViewController)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.moviesListTableView.delegate is HomeViewController)
    }
    
    // MARK: - search bar
    func test_HasSearchBar() {
        
        XCTAssertNotNil(sut.moviesSearchBar)
    }
    
    func test_ShouldSetSearchBarDelegate() {
        
        XCTAssertNotNil(self.sut.moviesSearchBar.delegate)
    }
    // MARK: - Search Auto
    
    func test_canProperlyDisplay_afterSearchTextChanges() {
        let movie1 = Movie(title: "mina", year: 10, cast: nil, genres: nil, rating: nil)
        let movie2 = Movie(title: "magdy", year: 7, cast: nil, genres: nil, rating: nil)
        sut.movies = [movie1 , movie2]
        let result = [movie2]
         sut.searchBar(sut.moviesSearchBar, textDidChange: "y")
       XCTAssertEqual(result ,  sut.searchArray)
        
        
       
    }

}
