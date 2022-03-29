//
//  Movie.swift
//  BestMovie
//
//  Created by Maxime Point on 27/03/2022.
//

import Foundation

struct PopularMovies: Codable {
    
    var page: Int
    var total_results: Int
    var total_pages: Int
    var results: [Movie]
    
    struct Movie: Identifiable, Codable, Equatable {
        let poster_path: String?
        //let adult: Bool
        let overview: String
        //let release_date: String
        //let genre_ids:[Int]
        let id: Int
        //let original_title: String
        //let original_language: String
        let title: String
        //let backdrop_path: String?
        let popularity: Float
        let vote_count: Int
        //let video: Bool
        let vote_average: Float
    }
}
