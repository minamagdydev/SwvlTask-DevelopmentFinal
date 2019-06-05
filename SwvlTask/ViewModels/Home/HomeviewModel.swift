//
//  HomeviewModel.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation

typealias onSuccess = ([Movie]) -> Void
typealias onError = (Error) -> Void
class HomeViewModel {
    public private(set) var fileReader: FileReader
    
    private var movies: [Movie]?
    private var sortedMovies: [Movie]?
    private var sorter: Sorter
    
    init(fileReader: FileReader, sorter: Sorter) {
       self.fileReader = fileReader
       self.sorter = sorter
    }


    func getMovies (onSuccess: @escaping onSuccess , onError: @escaping onError)  {
        fileReader.getFileData(onSuccess: { [weak self]data in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let moviesJson = try! decoder.decode([String:[Movie]].self, from: data)
            let movies = moviesJson["movies"]
            self?.movies = movies
            onSuccess(movies!)
        }) { error in
            onError(error)
        }
    }
    
    func search (movieName: String , movies: [Movie]) -> [Movie]? {
        if sortedMovies == nil {
            sortedMovies = sorter.sort(array: movies)
            
        }
        var resultArray = [Movie]()
        var lastYear = -1
        var numOfMoviesPerYear = 0
        if let sortedMovies = sortedMovies {
        for movie in sortedMovies {
            if movie.title!.lowercased().contains(movieName.lowercased()){
                if movie.year != lastYear {
                    numOfMoviesPerYear = 0
                    resultArray.append(movie)
                    lastYear = movie.year!
                    numOfMoviesPerYear = numOfMoviesPerYear + 1
                    continue
                }
                if movie.year == lastYear {
                    if numOfMoviesPerYear == 5 {
                        continue
                    }
                    resultArray.append(movie)
                    numOfMoviesPerYear =  numOfMoviesPerYear + 1
                }
            }
        }
    }
        return resultArray
    }
    
    
    
    
    
}
