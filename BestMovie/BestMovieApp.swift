//
//  BestMovieApp.swift
//  BestMovie
//
//  Created by Maxime Point on 26/03/2022.
//

import SwiftUI

@main
struct BestMovieApp: App {
    @StateObject var moviesViewModel = MoviesVM()
    
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: moviesViewModel)
        }
    }
}
