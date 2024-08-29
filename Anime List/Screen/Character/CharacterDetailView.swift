//
//  CharacterDetailView.swift
//  Anime List
//
//  Created by Tony Gultom on 29/08/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @State private var characterData: CharacterListData?
    
    @State private var hasFetchedData: Bool = false
    
    @State private var loading: Bool = false
    
    private var id: String
    
    init( id: String) {
        self.id = id
    }
    
    
    func getInitialData() {
        RequestData.getData(requestUrl: RequestURLList.getCharacterDetail(id: id), onSuccess: {(decodeable: CharacterDetailResponse) in self.characterData =  decodeable.data
            self.hasFetchedData = true
        }, onFailed: {error in print("something is error", error)}, onLoading: {loading.toggle()}, onFinally: {loading.toggle()})
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if(loading) {
                    ProgressView()
                } else {
                    if(characterData != nil) {
                        VStack (spacing: 20) {
                            AsyncImage(url: URL(string: characterData!.images.jpg.image_url))
                            Text(characterData!.name).fontWeight(.bold).font(.title).multilineTextAlignment(.center)
                            Text(characterData!.about).multilineTextAlignment(.center)
                          
                        }

                    }
                }
            }.padding().onAppear(perform: {
                if(!hasFetchedData) {
                    getInitialData()
                }
            })
        }.toolbar(.hidden, for: .tabBar)
        }
    }
