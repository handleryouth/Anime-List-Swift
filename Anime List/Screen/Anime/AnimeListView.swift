//
//  AnimeListView.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import SwiftUI

struct AnimeListView: View {
    
    
    @State private var loading = false
    @State private var animeList: AnimeListResponse?
    @State private var searchText = ""
    
    func getInitialData() {
        RequestData.getData(requestUrl: RequestURLList.getAnimeList, onSuccess: {(decodeable: AnimeListResponse) in self.animeList = decodeable}, onFailed: {error in print("something is error", error)}, onLoading: {loading.toggle()}, onFinally: {loading.toggle()})
    }
    
    
    
    func searchAnime() {
        if(!searchText.isEmpty) {
            RequestData.getData(requestUrl: RequestURLList.getSeachAnime, onSuccess: {(decodeable: AnimeListResponse) in self.animeList = decodeable}, onFailed: {error in print("something is error", error)}, queryItems: [URLQueryItem(name: "q", value: searchText)], onLoading: {loading.toggle()}, onFinally: {loading.toggle()})
        } else {
            getInitialData()
        }
    }

    
    var body: some View {
        NavigationStack {
            ScrollView{
                if(loading) {
                    
                    ProgressView()
                } else {
                    if(animeList != nil) {
                        ScrollView {
                            VStack {
                                ForEach(animeList!.data, id: \.self.mal_id) { data in
                                    NavigationLink(destination: AnimeDetailView(id: String(data.mal_id))) {
                                        AnimeThumbnailCard(animeData: data)
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        .searchable(text: $searchText).autocorrectionDisabled().textInputAutocapitalization(.never).onSubmit(of: .search) {
                            searchAnime()
                        }
                        
                    } else {
                        Text("No Data!")
                    }
                    
                }
            }.navigationTitle("Anime List")
                
        }.onAppear(perform: getInitialData)
    }
}

#Preview {
    AnimeListView()
}
