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
    var movie1: Movie!
    var movie2: Movie!
    var movie3: Movie!
    var movie4: Movie!
    var movie5: Movie!
    var moviesArray = [Movie]()
    var afterSearchArray = [Movie]()
    var searchedCharachter = "m"
    var fileReaderMock: SWVLFileReaderMock!
    var homeViewModel: HomeViewModel!
    var sorter: swvlSorter!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fileReaderMock = SWVLFileReaderMock()
        sorter = swvlSorter()
        homeViewModel = HomeViewModel(fileReader: fileReaderMock, sorter: sorter)
        movie1 = Movie(title: "mina", year: nil, cast: nil, genres: nil, rating: nil)
        movie2 = Movie(title: "magdy", year: nil, cast: nil, genres: nil, rating: nil)
        movie3 = Movie(title: "mohamed", year: nil, cast: nil, genres: nil, rating: nil)
        movie4 = Movie(title: "amr", year: nil, cast: nil, genres: nil, rating: nil)
        movie5 = Movie(title: "salah", year: nil, cast: nil, genres: nil, rating: nil)
        
        moviesArray = [movie1,movie2,movie3,movie4,movie5]
        afterSearchArray = [movie1,movie2,movie3,movie4]
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fileReaderMock.callOnSuccessFlag  = false
        fileReaderMock.callOnErrorFlag = false
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
    
    func test_getMovies_onSucces_callOnSuccesClouser() {
        fileReaderMock.callOnSuccessFlag = true
        var onSuccessFalgIsCalled = false
        homeViewModel.getMovies(onSuccess: { _ in
            onSuccessFalgIsCalled = true
        }) { _ in
            
        }
        XCTAssertTrue(onSuccessFalgIsCalled)
    }
    
    func test_getMovies_onSucces_doNotcallOnErrorClouser() {
        fileReaderMock.callOnSuccessFlag = true
        var onErrorFalgIsCalled = false
        homeViewModel.getMovies(onSuccess: { _ in
           
        }) { _ in
             onErrorFalgIsCalled = true
        }
        XCTAssertFalse(onErrorFalgIsCalled)
    }
    
    func test_getMovies_onError_callOnErrorClouser() {
        fileReaderMock.callOnErrorFlag = true
        var onErrorFalgIsCalled = false
        homeViewModel.getMovies(onSuccess: { _ in
            
        }) { _ in
            onErrorFalgIsCalled = true 
        }
        XCTAssertTrue(onErrorFalgIsCalled)
    }
    
    func test_getMovies_onError_doNotcallOnSucccessClouser() {
        fileReaderMock.callOnErrorFlag = true
        var onSuccessFalgIsCalled = false
        homeViewModel.getMovies(onSuccess: { _ in
            onSuccessFalgIsCalled = true
        }) { _ in
            
        }
        XCTAssertFalse(onSuccessFalgIsCalled)
    }
    
    func test_search_findCorrectly() {
        let resultArray = homeViewModel.search(movieName: searchedCharachter)
        XCTAssertEqual(afterSearchArray ,  resultArray)
    }
    

}
