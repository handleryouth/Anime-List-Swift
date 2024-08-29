//
//  ContentView.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            AnimeListView().tabItem{
                Label("Anime List", systemImage: "list.bullet.rectangle")
            }.tag(0)
            
            CharacterListView().tabItem{
                Label("Character List", systemImage: "person.fill")
            }.tag(1)
        }
    }
}
