//
//  AnimeList.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import Foundation


class AnimeImages: Codable {
  var jpg: JpgImage
}

class JpgImage: Codable {
  var image_url: String
  var small_image_url: String
  var large_image_url: String
}


class AnimeTitle: Codable {
  var type: String
  var title: String
}


class AnimeListData: Codable {
      var mal_id: Int
      var url: String
      var images: AnimeImages
      var approved: Bool
      var titles: [AnimeTitle]
      var title: String
      var title_english: String?
      var title_japanese: String
      var title_synonyms: [String]
      var type: String
      var source: String
      var episodes: Int?
      var status: String
      var duration: String
      var rating: String
      var score: Float?
      var scored_by: Int?
      var rank: Int?
      var popularity: Int
      var members: Int
      var favorites: Int
      var synopsis: String?
      var background: String
      var season: String?
      var year: Int?
    
}

class AnimeListResponse: Codable {
   var data: [AnimeListData]
}

class AnimeDetailResponse: Codable {
    var data: AnimeListData
}
