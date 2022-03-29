//
//  MovieDetailsVM.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

class MovieDetailsVM: ObservableObject {
    
    @Published var movieDetails: MovieDetails?
    @Published var isLoading: Bool = false
    
//    var backdrop_path: String {
//        guard let backdrop_path = movieDetails?.backdrop_path else {
//            return "defaultBackdrop"
//        }
//        return backdrop_path
//    }
//    
//    var poster_path: String {
//        guard let poster_path = movieDetails?.poster_path else {
//            return "defaultBackdrop"
//        }
//        return poster_path
//    }
//    
//    var overview: String {
//        guard let overview = movieDetails?.overview else {
//            return ""
//        }
//        return overview
//    }
//    
//    var popularity: Float {
//        movieDetails!.popularity
//    }
//    
//    var release_date: String {
//        movieDetails!.release_date
//    }
//    
//    var tagline: String {
//        guard let tagline = movieDetails?.tagline else {
//            return ""
//        }
//        return tagline
//    }
//
//    var title: String {
//        movieDetails!.title
//    }
//    
//    var vote_average: Float {
//        movieDetails!.vote_average
//    }
//    
//    var vote_count: Int {
//        movieDetails!.vote_count
//    }
//    
//    var genres: String {
//        var movieGenres = ""
//        if movieDetails!.genres.count > 0 {
//            for genre in movieDetails!.genres {
//                movieGenres += "\(genre.name) "
//            }
//        }
//        return movieGenres
//    }
//    
    

    
    func fetchMovie(movieId: Int) async {
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/\(movieId)?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR") else {
            print ("Error URL")
            return
        }
        isLoading = true
        
        do {
            // On verifie si on peut recuperer les datas (en gros si on a internet ou pas etc)
            let (data, _) = try await URLSession.shared.data(from: url)
            // On verifie si on peut decoder les datas json
            if let decodedResponse = try? JSONDecoder().decode(MovieDetails.self, from: data){
                DispatchQueue.main.async {
                    self.movieDetails = decodedResponse
                    self.isLoading = false
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}
