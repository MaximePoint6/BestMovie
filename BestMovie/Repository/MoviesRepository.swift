//
//  MoviesRepository.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import Foundation

class MoviesRepository {
    
    func popularMovies(page: Int) async -> PopularMovies? {
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/popular?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR&page=\(page)") else {
            print ("Error URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let decodedResponse = try? SnakeCaseJSONDecoder().decode(PopularMovies.self, from: data) else {
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
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let decodedResponse = try? SnakeCaseJSONDecoder().decode(MovieDetails.self, from: data) else {
                return nil
            }
            return decodedResponse
        } catch {
            print("Invalid data")
            return nil
        }
    }
    
    
    func movieVideos(movieId: Int) async -> MovieVideos? {
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR") else {
            print ("Error URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let decodedResponse = try? SnakeCaseJSONDecoder().decode(MovieVideos.self, from: data) else {
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
