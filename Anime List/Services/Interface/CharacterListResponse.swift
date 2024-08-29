//
//  CharacterListResponse.swift
//  Anime List
//
//  Created by Tony Gultom on 29/08/24.
//

import Foundation

class CharacterImageJPGFormat: Codable {
    var  image_url: String
}

class CharacterImages: Codable {
    var jpg: CharacterImageJPGFormat
}

class CharacterListData: Codable {
    var mal_id: Int
    var url: String
    var images: CharacterImages
    var name: String
    var name_kanji: String
    var nicknames: [String]
    var favorites: Int
    var about: String
}


class CharacterListResponse: Codable {
    var data: [CharacterListData]
}


class CharacterDetailResponse: Codable {
    var data: CharacterListData
}





