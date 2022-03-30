//
//  MovieDetailsVM.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

@MainActor class MovieDetailsVM: ObservableObject {
    
    @Published var movieDetails: MovieDetails?
    @Published var isLoading: Bool = false
    let moviesRepository = MoviesRepository()

    
    var posterPath: String {
        guard let posterPath = movieDetails?.posterPath else {
            return "defaultBackdrop"
        }
        return "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
    
    var backdropPath: String {
        guard let backdropPath = movieDetails?.backdropPath else {
            return "defaultBackdrop"
        }
        return "https://image.tmdb.org/t/p/w500/\(backdropPath)"
    }
    
    var title: String {
        guard let title = movieDetails?.title else {
            return ""
        }
        return title
    }
    
    var tagline: String {
        guard let tagline = movieDetails?.tagline else {
            return ""
        }
        return tagline
    }
    
    
    var overview: String {
        guard let overview = movieDetails?.overview else {
            return ""
        }
        return overview
    }
    
    var genres: String {
        guard let movieGenres = movieDetails?.genres else {
            return ""
        }
        var genres = [String]()
        if movieGenres.count > 0 {
            for genre in movieDetails!.genres {
                genres.append(genre.name)
            }
        }
        let list = genres.joined(separator: ", ")
        return list
    }
    
    var voteAverage: Float {
        guard let voteAverage = movieDetails?.voteAverage else {
            return 0.0
        }
        return voteAverage
    }
    
    var voteCount: Int {
        guard let voteCount = movieDetails?.voteCount else {
            return 0
        }
        return voteCount
    }
    
    
    var releaseDate: String {
        guard let releaseDate = movieDetails?.releaseDate else {
            return "Inconnue"
        }
        let Mydate = String(releaseDate.prefix(4))
        return Mydate
    }
    
    func loadData(movieID : Int) async {
        isLoading = true
        guard let response = await moviesRepository.movieDetails(movieId: movieID) else {
            isLoading = false
            return
        }
        movieDetails = response
        isLoading = false
    }
}
