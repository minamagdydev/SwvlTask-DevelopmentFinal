//
//  SorterTests.swift
//  SwvlTaskTests
//
//  Created by lujin sherif  on 6/3/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest

@testable import SwvlTask 
class SorterTests: XCTestCase {

    var movie1: Movie!
    var movie2: Movie!
    var movie3: Movie!
    var movie4: Movie!
    var movie5: Movie!
    var unsortedMovies = [Movie]()
    var sortedMovies = [Movie]()
    var sorter = swvlSorter()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movie1 = Movie(title: nil, year: 700, cast: nil, genres: nil, rating: nil)
        movie2 = Movie(title: nil, year: 200, cast: nil, genres: nil, rating: nil)
        movie3 = Movie(title: nil, year: 500, cast: nil, genres: nil, rating: nil)
        movie4 = Movie(title: nil, year: 300, cast: nil, genres: nil, rating: nil)
        movie5 = Movie(title: nil, year: 400, cast: nil, genres: nil, rating: nil)
        
        unsortedMovies.append(movie1)
        unsortedMovies.append(movie2)
        unsortedMovies.append(movie3)
        unsortedMovies.append(movie4)
        unsortedMovies.append(movie5)
        
        sortedMovies.append(movie1)
        sortedMovies.append(movie3)
        sortedMovies.append(movie5)
        sortedMovies.append(movie4)
        sortedMovies.append(movie2)
        
        
        
        
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
    
    func test_mergesort_sortCorrectly() {
      let resultArray = sorter.sort(array: unsortedMovies)
      XCTAssertEqual(sortedMovies ,  resultArray)
    }

}
