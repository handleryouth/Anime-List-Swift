//
//  CharacterListView.swift
//  Anime List
//
//  Created by Tony Gultom on 29/08/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var loading: Bool = false
    
    @State private var characterData: [CharacterListData] = []
    
    @State private var hasFetchedData: Bool = false
    
    
    func getInitialData() {
        RequestData.getData(requestUrl: RequestURLList.getCharacterList, onSuccess: {(decodeable: CharacterListResponse) in self.characterData =  decodeable.data
            self.hasFetchedData = true
            
        }, onFailed: {error in print("something is error", error)}, onLoading: {loading.toggle()}, onFinally: {loading.toggle()})
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
            if(loading) {
                ProgressView()
            } else {
                VStack(spacing: 40) {
                    ForEach(characterData, id: \.self.mal_id) { data in
                        NavigationLink(destination: CharacterDetailView(id: String(data.mal_id))) {
                            CharacterThumbnailCard(characterData: data)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.frame(maxWidth: .infinity)
            }
            }.onAppear(perform: {
                if(!hasFetchedData) {
                    print("fetching data called")
                    getInitialData()
                }
            }) .navigationTitle("Character List")
        }
       
    }
}


