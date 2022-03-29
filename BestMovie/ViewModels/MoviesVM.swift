//
//  PopularMoviesVM.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

class MoviesVM: ObservableObject {
    
    @Published var popularMovies: [PopularMovies.Movie] = []
    @Published var isLoading: Bool = false
    var page: Int = 1
    var totalPages: Int = 1
    
    
    func fetchDataIfNeeded(movie: PopularMovies.Movie) async {
        if popularMovies.last == movie && page <= totalPages && !isLoading {
            page += 1
            await loadData()
        }
    }
    
    
    func loadData() async {
        // On verifie l'url
        guard let url = URL(string : "https://api.themoviedb.org/3/movie/popular?api_key=0c2ecacd365f6bba06193dcf0475617d&language=fr-FR&page=\(page)") else {
            print ("Error URL")
            return
        }
        isLoading = true
        
        do {
            // On verifie si on peut recuperer les datas (en gros si on a internet ou pas etc)
            let (data, _) = try await URLSession.shared.data(from: url)
            // On verifie si on peut decoder les datas json
            if let decodedResponse = try? JSONDecoder().decode(PopularMovies.self, from: data){
                DispatchQueue.main.async {
                    self.popularMovies.append(contentsOf: decodedResponse.results)
                    //popularMovies = decodedResponse.results
                    self.totalPages = decodedResponse.total_results
                    self.isLoading = false
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}
