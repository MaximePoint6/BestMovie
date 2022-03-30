//
//  MoviesRepository.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import Foundation

class MoviesRepository {
    
    func popularMovies(page: Int) async -> PopularMovies? {
        
        // On verifie l'url
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/popular?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR&page=\(page)") else {
            print ("Error URL")
            return nil
        }
        do {
            // On verifie si on peut recuperer les datas (en gros si on a internet ou pas etc)
            let (data, _) = try await URLSession.shared.data(from: url)
            // On verifie si on peut decoder les datas json
            guard let decodedResponse = try? SnakeCaseJSONDecoder().decode(PopularMovies.self, from: data) else {
//                DispatchQueue.main.async {
//                    self.popularMovies.append(contentsOf: decodedResponse)
//                    //popularMovies = decodedResponse.results
//                    self.totalPages = decodedResponse.total_results
//                    self.isLoading = false
//                }
                return nil
            }
            return decodedResponse
        } catch {
            print("Invalid data")
            return nil
        }
    }
    
    
    func movieDetails(movieId: Int) async -> MovieDetails? {
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/\(movieId)?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR") else {
            print ("Error URL")
            return nil
        }
        do {
            // On verifie si on peut recuperer les datas (en gros si on a internet ou pas etc)
            let (data, _) = try await URLSession.shared.data(from: url)
            // On verifie si on peut decoder les datas json
            guard let decodedResponse = try? SnakeCaseJSONDecoder().decode(MovieDetails.self, from: data) else {
//                DispatchQueue.main.async {
//                    self.movieDetails = decodedResponse
//                    self.isLoading = false
//                }
                return nil
            }
            return decodedResponse
        } catch {
            print("Invalid data")
            return nil
        }
    }
    
    
}

class SnakeCaseJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
