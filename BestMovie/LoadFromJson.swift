//
//  LoadFromJson.swift
//  BestMovie
//
//  Created by Maxime Point on 29/03/2022.
//

import Foundation

var previewMovieDetails: MovieDetails = load("MovieDetailsExample.json")
var previewPopularMovie: PopularMovies.Movie = load("PopularMovieExample.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = SnakeCaseJSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
