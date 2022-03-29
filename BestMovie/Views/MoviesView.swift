//
//  Movies.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesVM
    
    var body: some View {
        NavigationView {
            VStack {
                List (viewModel.popularMovies) { movie in
                    NavigationLink  {
                            MovieDetailsView(idMovie: movie.id)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")")){ image in
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
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(.orange)
                                    Text(String(format: "%.1f", movie.vote_average))
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    .task {
                        await viewModel.fetchDataIfNeeded(movie: movie)
                    }
                }
                if viewModel.isLoading {
                        ProgressView ()
                }
            }
            .navigationTitle("Films populaires")
        }.accentColor(.white)
            .task {
            await viewModel.loadData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    
    @StateObject static var viewModel = MoviesVM()
    
    static var previews: some View {
        MoviesView(viewModel: viewModel)
            //.environmentObject(popularMoviesViewModel)
    }
}
