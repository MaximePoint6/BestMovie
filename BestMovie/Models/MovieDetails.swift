//
//  MovieDetails.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

struct MovieDetails: Identifiable, Codable {

    //let adult: Bool
    let backdrop_path: String?
    //let belongs_to_collection: String?
    //let budget: Int
    //let homepage: String?
    let id:Int
    //let imdb_id: String?
    //let original_language: String
    //let original_title: String
    let overview: String?
    let popularity: Float
    let poster_path: String?
    let release_date: String
    //let revenue: Int
    //let runtime: Int?
    //let status: String
    let tagline: String?
    let title: String
    //let video: Bool
    let vote_average: Float
    let vote_count: Int
    let genres: [Genres]
    //let production_companies: [Production_companies]
    //let production_countries: [Production_countries]
    //let spoken_languages: [Spoken_languages]

    struct Genres: Identifiable, Codable, Equatable {
        let id: Int
        let name: String
    }

//    struct Production_companies: Identifiable, Codable, Equatable {
//        let name: String
//        let id: Int
//        let logo_path: String?
//        let origin_country: String
//    }

//    struct Production_countries: Codable, Equatable {
//        let iso_3166_1: String
//        let name: String
//    }
//
//    struct Spoken_languages: Codable, Equatable {
//        let iso_639_1: String
//        let name: String
//    }

}

