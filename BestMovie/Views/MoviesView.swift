//
//  Movies.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesVM
    
    @State private var showingSheet = false
    @State var movieID: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List (viewModel.popularMovies) { movie in
                    Button  {
                        self.movieID = movie.id
                        self.showingSheet.toggle()
                    } label: {
                        MovieCellView(movie: movie)
                    }.task {
                        await viewModel.fetchDataIfNeeded(movie: movie)
                    }
                }.sheet(isPresented: $showingSheet) {
                    if let movieIDValid = $movieID {
                        MovieDetailsView(idMovie: movieIDValid)
                    }
                }
                if viewModel.isLoading {
                    ProgressView ()
                }
            }
            .navigationTitle("Films populaires")
        }.task {
            await viewModel.loadData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    
    @StateObject static var viewModel = MoviesVM()
    
    static var previews: some View {
        MoviesView(viewModel: viewModel)
    }
}
