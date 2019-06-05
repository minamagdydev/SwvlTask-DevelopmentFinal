//
//  FileReader1.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation

protocol FileReader {
    func getFileData(onSuccess: @escaping (Data) -> Void , onError: @escaping (Error) -> Void)
}
