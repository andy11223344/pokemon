//
//  PokemonModel.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation


struct PokemonModel: Codable {
    let id: Int
    let name: String
    let weight: Int
    let moves: [Move]
    let sprites: Sprites
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, weight, moves
        case sprites
    }
}

struct Move: Codable {
    let move: Info

    enum CodingKeys: String, CodingKey {
        case move
    }
}

struct Info: Codable {
    let name: String
    let url: String
}

class Sprites: Codable {
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case other
    }
}

struct Other: Codable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
