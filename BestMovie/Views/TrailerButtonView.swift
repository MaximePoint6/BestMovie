//
//  TrailerButtonView.swift
//  BestMovie
//
//  Created by Maxime Point on 29/03/2022.
//

import SwiftUI

struct TrailerButtonView: View {
    var body: some View {
            Button {
                //
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
            }
    }
}

struct TrailerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerButtonView()
            .previewLayout(.sizeThatFits)
    }
}
