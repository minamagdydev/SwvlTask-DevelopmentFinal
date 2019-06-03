//
//  SWVLFileReaderMock.swift
//  SwvlTaskTests
//
//  Created by lujin sherif  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation
@testable import SwvlTask
class SWVLFileReaderMock: FileReader {
    var getFileDataIsCalled: Bool = false
    func getFileData(onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        getFileDataIsCalled = true        
    }

    
}
