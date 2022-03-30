//
//  TrailerMovie.swift
//  BestMovie
//
//  Created by Maxime Point on 30/03/2022.
//

import SwiftUI
import AVKit

struct TrailerMovie: View {
    
    @ObservedObject var viewModel: MovieDetailsVM
    @Binding var idMovie: Int
    
    var body: some View {
        VStack {
            VideoView(videoID: viewModel.keys)
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height)
                .scaledToFit()
        }.task {
            await viewModel.movieVideos(movieID: idMovie)
        }
    }
}

struct TrailerMovie_Previews: PreviewProvider {
    
    @StateObject static var viewModel = MovieDetailsVM()
    @State static private var idMovie = 550
    
    static var previews: some View {
        TrailerMovie(viewModel: viewModel, idMovie: $idMovie)
    }
}
