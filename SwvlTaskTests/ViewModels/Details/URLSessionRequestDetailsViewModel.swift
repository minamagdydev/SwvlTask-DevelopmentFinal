//
//  URLSessionRequestDetailsViewModel.swift
//  SwvlTaskTests
//
//  Created by minamagdy  on 6/5/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest
@testable import SwvlTask
class URLSessionRequestDetailsViewModel: XCTestCase {
   
    var viewModel : DetailsViewModel?
    let session = mockURLSession()
    
    var actualData: Data?
    var actualResponse: URLResponse?
    var actualError: Error?
    override func setUp() {
        viewModel = DetailsViewModel()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    func test_execute_startsTheRequest() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        let urlStr = "https://reqres.in/api"

        let url = URL(string:"https://reqres.in/api")
        _ = viewModel?.getImages(urlSession: session, url: urlStr, completion: { images in
            print ("")
        
    } )
        
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 300,
                                               httpVersion: nil, headerFields: nil)
        
        XCTAssertTrue(dataTask.resumeIsCalled)
    }
 

}
