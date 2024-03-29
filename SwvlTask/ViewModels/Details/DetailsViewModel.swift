//
//  HomeviewModel.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation
import UIKit
typealias CompletionHandler = ([Photo]) -> Void
class DetailsViewModel {
    private var photos: [Photo]?
    func getImages(urlSession: URLSession ,url: String , completion: @escaping CompletionHandler){
        
        let urlStr : String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let PhotoUrl = URL(string: urlStr ){
            urlSession.dataTask(with: PhotoUrl) { (data, response
                , error) in
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let photosJson = try! decoder.decode(AllPhotos.self, from: data)
                
                if let movies = photosJson.photos?.photo
                {
                
                completion(movies)
                }
                
                }.resume()
        }
        
        
    }
    
    
    
    
    
}
