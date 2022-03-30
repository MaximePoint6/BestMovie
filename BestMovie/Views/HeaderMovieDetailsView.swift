//
//  HeaderMovieDetailsView.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import SwiftUI

struct HeaderMovieDetailsView: View {
    
    var movie: MovieDetails
    
    var body: some View {
        ZStack (alignment: .bottomLeading){
            AsyncImage(url: URL(string: movie.backdropPath)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 400, alignment: .top)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(0.5)
            }
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(1), .clear]),
                startPoint: .bottom,
                endPoint: .top)
                .frame(height: 150)
            Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct HeaderMovieDetailsView_Previews: PreviewProvider {
    
    static var movie = previewMovieDetails
    
    static var previews: some View {
        HeaderMovieDetailsView(movie: <#T##MovieDetails#>)
    }
}
