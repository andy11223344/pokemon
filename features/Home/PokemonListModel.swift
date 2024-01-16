//
//  PokemonModel.swift
//  Home
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
// MARK: - PokeList
struct BasePokeListModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokeListModel]
}

// MARK: - Result
struct PokeListModel: Codable {
    let name: String
    let url: String
}
