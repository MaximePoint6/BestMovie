//
//  TrailerButtonView.swift
//  BestMovie
//
//  Created by Maxime Point on 29/03/2022.
//

import SwiftUI

struct TrailerButtonView: View {
    
    @State private var showingSheet = false
    @ObservedObject var viewModel: MovieDetailsVM
    @Binding var idMovie: Int
    
    var body: some View {
            Button {
                showingSheet.toggle()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                    Text("TRAILER")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                }.padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color("Background"))
                    .clipShape(Capsule())
            }.sheet(isPresented: $showingSheet) {
                TrailerMovie(viewModel: viewModel, idMovie: $idMovie)
            }
    }
}

struct TrailerButtonView_Previews: PreviewProvider {
    
    @StateObject static var viewModel = MovieDetailsVM()
    @State static private var idMovie = 550
    
    static var previews: some View {
        TrailerButtonView(viewModel: viewModel, idMovie: $idMovie)
            .previewLayout(.sizeThatFits)
    }
}
