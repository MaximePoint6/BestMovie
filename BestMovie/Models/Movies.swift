//
//  Movie.swift
//  BestMovie
//
//  Created by Maxime Point on 27/03/2022.
//

import Foundation

struct PopularMovies: Codable {
    
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var results: [Movie]
    
    struct Movie: Identifiable, Codable, Equatable {
        let posterPath: String?
        //let adult: Bool
        let overview: String
        //let releaseDate: String
        //let genreIds:[Int]
        let id: Int
        //let originalTitle: String
        //let originalLanguage: String
        let title: String
        //let backdropPath: String?
        let popularity: Float
        let voteCount: Int
        //let video: Bool
        let voteAverage: Float
    }
}
