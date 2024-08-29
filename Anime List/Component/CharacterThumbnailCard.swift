//
//  CharacterThumbnailCard.swift
//  Anime List
//
//  Created by Tony Gultom on 29/08/24.
//

import SwiftUI

struct CharacterThumbnailCard: View {
    private var characterData: CharacterListData
    
    
    init(characterData: CharacterListData) {
        self.characterData = characterData
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: characterData.images.jpg.image_url)){
                image in image.resizable().aspectRatio(9/16, contentMode:.fit).frame(width: UIScreen.main.bounds.size.width - 200, alignment: .center)
            } placeholder: {
                VStack{
                    ProgressView()
                }.frame(width: UIScreen.main.bounds.size.width - 200, height: 200, alignment: .center)
            }
            Text(characterData.name)
        }.listRowSeparator(.hidden)
    }
}

