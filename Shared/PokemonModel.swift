//
//  PokemonModel.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation

public  struct PokemonModel: Codable {
    public let id: Int
    public let name: String
    public let weight: Int
    public let moves: [Move]
    public let sprites: Sprites
    public let types: [TypeElement]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, weight, moves
        case sprites, types
        case renamedSequence
    }
    
    public var renamedSequence: Int?
    public var nameSequence: String {
        guard let renamedSequence else { return name }
        return name + "-\(Fibonacci(sequence: renamedSequence).next)"
    }
}

public struct Move: Codable {
    public let move: Info

    enum CodingKeys: String, CodingKey {
        case move
    }
}

public struct Info: Codable {
    public let name: String
    public let url: String
}

public struct Sprites: Codable {
    public let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case other
    }
}

public struct Other: Codable {
    public let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

public struct OfficialArtwork: Codable {
    public let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

public struct TypeElement: Codable {
    public let slot: Int
    public let type: Info
}
