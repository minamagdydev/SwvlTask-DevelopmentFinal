//
//  SWVLFileReaderMock.swift
//  SwvlTaskTests
//
//  Created by minamagdy  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation
@testable import SwvlTask
class SWVLFileReaderMock: FileReader {
    var getFileDataIsCalled: Bool = false
    var callOnSuccessFlag: Bool = false
    var callOnErrorFlag: Bool = false
    
    func getFileData(onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        getFileDataIsCalled = true
        let string = "{\"movies\": [{\"title\": \"(500) Days of Summer\",\"year\": 2009,\"cast\": [\"Joseph Gordon-Levitt\",\"Zooey Deschanel\"],\"genres\": [\"Romance\",\"Comedy\"],\"rating\": 1}]}"
        let data = string.data(using: .utf8)
        if callOnSuccessFlag {
            onSuccess(data!)
        }
        
        if callOnErrorFlag {
            let error = FakeError()
            onError(error)
        }
    }

    
}


class FakeError: Error {
    init() {
        
    }
}
