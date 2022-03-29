//
//  MovieDetailsView.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel = MovieDetailsVM()
    var idMovie: Int
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack (alignment: .bottomLeading){
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.movieDetails?.backdrop_path ?? "")")){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 400, alignment: .top)
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(1), .clear]),
                    startPoint: .bottom,
                    endPoint: .top)
                    .frame(height: 150)
                Text(viewModel.movieDetails?.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            HStack {
                VStack (alignment: .leading, spacing: 10){
                    Text(viewModel.movieDetails?.title ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(viewModel.movieDetails?.tagline ?? "")
                        .font(.caption)
                        .fontWeight(.bold)
                    TrailerButtonView()
                        .padding(.bottom)
                    Text("Date de sortie : \(viewModel.movieDetails?.release_date ?? "")")
                        .font(.caption)
                        .padding(.bottom)
//                    Text("Genres : \(viewModel.genres)")
//                        .font(.caption)
                }
                Spacer()
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.movieDetails?.poster_path ?? "")")){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.trailing ,10)
                } placeholder: {
                    Color.gray
                }.frame(maxWidth: 120, maxHeight: 200)
                .cornerRadius(5)
            }.padding()
            
            VStack {
//                Text("Note moyenne : \(viewModel.movieDetails?.vote_average)")
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                Text("Nombre de vote : \(viewModel.movieDetails?.vote_count)")
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
                Text(viewModel.movieDetails?.overview ?? "")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
        }.ignoresSafeArea()
            .task {
                await viewModel.fetchMovie(movieId: idMovie)
            }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    
    static private var idMovie = 500
    
    static var previews: some View {
        NavigationView{
            MovieDetailsView(idMovie: idMovie)
        }
    }
}
