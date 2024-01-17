//
//  PokemonModel.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
// MARK: - PokeList
public struct BasePokeListModel: Codable {
    public let count: Int
    public let next: String
    public let previous: String?
    public let results: [PokeListModel]
}

// MARK: - Result
public struct PokeListModel: Codable {
    public let name: String
    public let url: String
}
