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
                        HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")){ image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray, lineWidth: 0.2)
                                    )
                                    .padding(.trailing ,10)
                            } placeholder: {
                                Color.gray.opacity(0.5)
                            }.frame(width: 120)
                                .cornerRadius(15)
                            VStack (alignment: .leading){
                                Text(movie.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 5)
                                    .lineLimit(2)
                                Text(movie.overview)
                                    .lineLimit(3)
                                    .padding(.bottom, 3)
                                    .foregroundColor(.gray)
                                HStack (alignment: .center){
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.orange)
                                    Text(String(format: "%.1f", movie.voteAverage))
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    .task {
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
