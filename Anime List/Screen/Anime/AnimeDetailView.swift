//
//  AnimeDetailView.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import SwiftUI

struct AnimeDetailView: View {
    private var id: String
    
    
    @State private var loading = false
    @State private var animeData: AnimeDetailResponse?
    
    
    init(id: String) {
        self.id = id
    }
    
    
    func getInitialData() {
        RequestData.getData(requestUrl: RequestURLList.getSearchById(id: id), onSuccess: {(decodeable: AnimeDetailResponse) in self.animeData =  decodeable}, onFailed: {error in print("something is error", error)}, onLoading: {loading.toggle()}, onFinally: {loading.toggle()})
    }
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                if(loading) {
                    ProgressView()
                } else {
                    if(animeData != nil) {
                        VStack (spacing: 20) {
                            AsyncImage(url: URL(string: animeData!.data.images.jpg.image_url))
                            Text(animeData!.data.title).fontWeight(.bold).font(.title).multilineTextAlignment(.center)
                            Text(animeData!.data.synopsis ?? "").multilineTextAlignment(.center)
                            Text("Episodes: \(String(describing: animeData!.data.episodes ?? 0))")
                            Text("Rating: \(animeData!.data.rating)")
                            Text("Year: \(String(describing: animeData!.data.year ?? 0000))")
                        }
           
                    }
                }
            }.onAppear(perform: getInitialData)
        }.toolbar(.hidden, for: .tabBar)

    }
}

