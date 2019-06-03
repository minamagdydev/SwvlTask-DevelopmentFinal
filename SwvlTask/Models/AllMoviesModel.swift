//
//  AllMoviesModel.swift
//  SwvlTask
//
//  Created by mina  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation

// MARK: - AllMovies
struct AllJsonData: Codable {
    let objects: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let title: String?
    let year: Int?
    let cast: [String]?
    let genres: [Genre]?
    let rating: Int?
}

enum Genre: String, Codable {
    case action = "Action"
    case adventure = "Adventure"
    case animated = "Animated"
    case biography = "Biography"
    case comedy = "Comedy"
    case crime = "Crime"
    case dance = "Dance"
    case disaster = "Disaster"
    case documentary = "Documentary"
    case drama = "Drama"
    case erotic = "Erotic"
    case family = "Family"
    case fantasy = "Fantasy"
    case featuresTheOrganization = "Features the organization"
    case foundFootage = "Found Footage"
    case historical = "Historical"
    case horror = "Horror"
    case independent = "Independent"
    case legal = "Legal"
    case liveAction = "Live Action"
    case martialArts = "Martial Arts"
    case musical = "Musical"
    case mystery = "Mystery"
    case noir = "Noir"
    case performance = "Performance"
    case political = "Political"
    case romance = "Romance"
    case satire = "Satire"
    case scienceFiction = "Science Fiction"
    case slasher = "Slasher"
    case sports = "Sports"
    case spy = "Spy"
    case superhero = "Superhero"
    case supernatural = "Supernatural"
    case suspense = "Suspense"
    case teen = "Teen"
    case thriller = "Thriller"
    case war = "War"
    case western = "Western"
}
