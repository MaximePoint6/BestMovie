//
//  MovieCellView.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import SwiftUI

struct MovieCellView: View {
    
    var movie: PopularMovies.Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.5)
            }.frame(minWidth: 120, maxWidth: 120, maxHeight: 150)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                .padding(.trailing ,10)
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
}

struct MovieCellView_Previews: PreviewProvider {
    
    static var movie = previewPopularMovie
    
    static var previews: some View {
        MovieCellView(movie: movie)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
