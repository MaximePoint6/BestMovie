//
//  MovieVideo.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import Foundation

struct MovieVideos: Identifiable, Codable {
    
    let id: Int
    let results: [Videos]
    
    struct Videos: Identifiable, Codable, Equatable {
        let site: String
        let key: String
        let id: String
    }
}
