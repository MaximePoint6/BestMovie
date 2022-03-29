////
////  PosterGridView.swift
////  BestMovie
////
////  Created by Maxime Point on 29/03/2022.
////
//
//import SwiftUI
//
//struct PosterGridView: View {
//    
//    @ObservedObject var viewModel: MoviesVM
//    
//    private let layout = [
//        GridItem(.flexible(), spacing: 4, alignment: .center),
//        GridItem(.flexible(), spacing: 4, alignment: .center),
//        GridItem(.flexible(), spacing: 4, alignment: .center),
//    ]
//    
//    let pictureSize = (UIScreen.main.bounds.width - 12) / 3
//    
//    var body: some View {
//        NavigationView{
//            VStack {
//                //LazyVGrid(columns : layout, spacing: 4){
//                    List (viewModel.popularMovies) { movie in
//                        NavigationLink  {
//                            MovieDetailsView(idMovie: movie.id)
//                        } label: {
//                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")")){ image in
//                                image.resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .cornerRadius(15)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 15)
//                                            .stroke(Color.gray, lineWidth: 0.2)
//                                    )
//                                    .padding(.trailing ,10)
//                            } placeholder: {
//                                Color.gray
//                            }.frame(width: 70, height: 100)
//                                .cornerRadius(15)
//                        }
//                    }
//                //}
//            }
//            .navigationTitle("Films populaires")
//        }
//        .task {
//            await viewModel.loadData()
//        }
//    }
//}
//
//struct Movies2View_Previews: PreviewProvider {
//    
//    @StateObject static var viewModel = MoviesVM()
//    
//    static var previews: some View {
//        PosterGridView(viewModel: viewModel)
//    }
//}
