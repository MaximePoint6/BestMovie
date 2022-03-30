//
//  PopularMoviesVM.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import Foundation

@MainActor class MoviesVM: ObservableObject {
    
    @Published var popularMovies: [PopularMovies.Movie] = []
    @Published var isLoading: Bool = false
    var page: Int = 1
    var totalPages: Int = 1
    let moviesRepository = MoviesRepository()
    
    func fetchDataIfNeeded(movie: PopularMovies.Movie) async {
        if popularMovies.last == movie && page <= totalPages && !isLoading {
            page += 1
            await loadData()
        }
    }
    
    func loadData() async {
        isLoading = true
        guard let response = await moviesRepository.popularMovies(page: page) else {
            isLoading = false
            return
        }
        popularMovies.append(contentsOf: response.results)
        totalPages = response.totalResults
        isLoading = false
    }
    
}
