//
//  MovieDetails.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

struct MovieDetails: Identifiable, Codable {

    //let adult: Bool
    let backdropPath: String?
    //let belongsToCollection: String?
    //let budget: Int
    //let homepage: String?
    let id:Int
    //let imdbId: String?
    //let originalLanguage: String
    //let originalTitle: String
    let overview: String?
    let popularity: Float
    let posterPath: String?
    let releaseDate: String
    //let revenue: Int
    //let runtime: Int?
    //let status: String
    let tagline: String?
    let title: String
    //let video: Bool
    let voteAverage: Float
    let voteCount: Int
    let genres: [Genres]
    //let productionCompanies: [Production_companies]
    //let productionCountries: [Production_countries]
    //let spokenLanguages: [Spoken_languages]

    struct Genres: Identifiable, Codable, Equatable {
        let id: Int
        let name: String
    }

//    struct Production_companies: Identifiable, Codable, Equatable {
//        let name: String
//        let id: Int
//        let logoPath: String?
//        let originCountry: String
//    }

//    struct ProductionCountries: Codable, Equatable {
//        let iso31661: String
//        let name: String
//    }
//
//    struct Spoken_languages: Codable, Equatable {
//        let iso6391: String
//        let name: String
//    }

}

