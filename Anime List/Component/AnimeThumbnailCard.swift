//
//  AnimeThumbnailCard.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import SwiftUI

struct AnimeThumbnailCard: View {
    private var animeData: AnimeListData
    
    init(animeData: AnimeListData) {
        self.animeData = animeData
    }
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: animeData.images.jpg.large_image_url)){
                image in image.resizable().aspectRatio(9/16, contentMode:.fit).frame(width: 250, alignment: .center)
            } placeholder: {
                VStack{
                    ProgressView()
                }.frame(width: 250, height: 200, alignment: .center)
            }
            Text(animeData.title).multilineTextAlignment(.center)
        }.padding().listRowSeparator(.hidden)
    }
}

