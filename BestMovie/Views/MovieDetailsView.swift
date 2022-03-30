//
//  MovieDetailsView.swift
//  BestMovie
//
//  Created by Maxime Point on 28/03/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel = MovieDetailsVM()
    @Binding var idMovie: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                ZStack (alignment: .bottomLeading){
                    AsyncImage(url: URL(string: viewModel.backdropPath)){ image in
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
                    Text(viewModel.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                HStack {
                    VStack (alignment: .leading, spacing: 10){
                        Text(viewModel.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(viewModel.tagline)
                            .font(.caption)
                            .fontWeight(.bold)
                        TrailerButtonView()
                            .padding(.bottom)
                        Text("Genres : \(viewModel.genres)")
                            .font(.caption)
                        Text("Date de sortie : \(viewModel.releaseDate)")
                            .font(.caption)
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.orange)
                            Text(String(format: "%.1f", viewModel.voteAverage))
                                .font(.footnote)
                            Text("(Nombre de votes : \(viewModel.voteCount))")
                                .font(.footnote)
                        }
                    }
                    Spacer()
                    AsyncImage(url: URL(string: viewModel.posterPath)){ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                            .padding(.trailing ,10)
                    } placeholder: {
                        Color.gray.opacity(0.5)
                    }.frame(maxWidth: 120, maxHeight: 200)
                        .cornerRadius(5)
                }.padding(.horizontal)
                JustifiedText(viewModel.overview)
                    .font(.caption)
                    .padding(.horizontal)
                Spacer()
            }
            .ignoresSafeArea()
            .task {
                await viewModel.loadData(movieID: idMovie)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundColor(.white).opacity(0.7)
                            .font(.system(size: 25))
                    })
                }
            }
        }
        
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    
    @State static private var idMovie = 550
    
    static var previews: some View {
        NavigationView{
            MovieDetailsView(idMovie: $idMovie)
        }
    }
}
