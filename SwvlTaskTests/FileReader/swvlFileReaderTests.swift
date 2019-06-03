//
//  swvlFileReaderTests.swift
//  SwvlTaskTests
//
//  Created by lujin sherif  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import XCTest
@testable import SwvlTask
class swvlFileReaderTests: XCTestCase {

    var swvlfileReader: SWVLFileReader!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        swvlfileReader = SWVLFileReader(fileName: "all_movies", type: "json")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        swvlfileReader = SWVLFileReader(fileName: "all_movies", type: "json")
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
    
    func test_init_fileNameDoNotExist_returnNil() {
       let wrongFileName = "a"
       swvlfileReader = SWVLFileReader(fileName: wrongFileName, type: "json")
       XCTAssertNil(swvlfileReader)
    }
    
    func test_init_fileNameExist_doNotReturnNil() {
        XCTAssertNotNil(swvlfileReader)
    }
    
    func test_getFileData_onSuccess_callOnSuccessClosure() {
        var onSuccessFlag = false
        swvlfileReader.getFileData(onSuccess: { data in
            onSuccessFlag = true
        }) { error in
        }
        sleep(3)
        XCTAssertTrue(onSuccessFlag)
        
    }
    
    func test_getFileData_onSuccess_doNotCallOnErrorClosure() {
        var onErrorFlag = false
        swvlfileReader.getFileData(onSuccess: { data in
           
        }) { error in
            onErrorFlag = true
        }
        sleep(3)
        XCTAssertFalse(onErrorFlag)
        
    }
    

    

}
