//
//  HomeviewModel.swift
//  SwvlTask
//
//  Created by lujin sherif  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation

typealias onSuccess = ([Movie]) -> Void
typealias onError = (Error) -> Void
class HomeViewModel {
    public private(set) var fileReader: FileReader
    
    init(fileReader: FileReader) {
       self.fileReader = fileReader
    }
  
    
//    var numberOfSections: Int {
////        return AllJsonData[0].count
//    }


    func getMovies (onSuccess: @escaping onSuccess , onError: @escaping onError)  {
        fileReader.getFileData(onSuccess: { data in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let moviesJson = try! decoder.decode([String:[Movie]].self, from: data)
            let movies = moviesJson["movies"]
            onSuccess(movies!)
        }) { error in
            onError(error)
        }
    }
}
